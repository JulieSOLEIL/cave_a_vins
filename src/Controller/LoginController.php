<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class LoginController extends AbstractController
{
    #[Route('/login', name: 'login')]
    public function formLogin(AuthenticationUtils $authenticationUtils): Response
    {
        $error = $authenticationUtils->getLastAuthenticationError();
        $lastEmail = $authenticationUtils->getLastUsername();

        return $this->render('login/formLogin.html.twig', [
            'error' => $error,
            'lastEmail' => $lastEmail
        ]);
    }
   
    #[Route('/deconnexion', name:'userLogout')]
    public function logout()
   {
    
   }

   #[Route('/user/new', name: 'user.new')]
   public function new(Request $request, UserPasswordHasherInterface $hasher, EntityManagerInterface $entityManager): Response
   {
       $user = new User();
       $form = $this->createForm(UserType::class, $user);
       $form->handleRequest($request);

       if ($form->isSubmitted() && $form->isValid()) {
            $post = $request->get('user');
            $user->addRole($post['role']);
            $psw = $hasher->hashPassword($user, $post['password']);
            $user->setPassword($psw);
            dd($user);
            $entityManager->persist($user);
            $entityManager->flush();

            return $this->redirectToRoute('user.new');
       }

       return $this->renderForm('/login/newForm.html.twig', [
           'newForm' => $form
       ]);
   }

   #[Route('user/{id}/edit', name: 'user.edit', methods: ['GET','POST'])]
   public function edit(Request $request, User $user, EntityManagerInterface $emi): Response
   {
       if ($request->getMethod() === 'POST') {
            $email = $request->get('email');
            if ($email !== $user->getEmail()) {
            $user->setEmail($email);
            $emi->flush();

            return $this->redirectToRoute('user.list');
            }
       }
       return $this->renderForm('login/formEdit.html.twig', [
           'user' => $user,
       ]);
   }
}
