<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
use Doctrine\ORM\EntityManager;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class LoginController extends AbstractController
{
    #[Route('/connexion', name: 'login')]
    public function formLogin(AuthenticationUtils $authenticationUtils): Response
    {
        $error = $authenticationUtils->getLastAuthenticationError();
        $lastEmail = $authenticationUtils->getLastUsername();

        return $this->render('login/formLogin.html.twig', [
            'error' => $error,
            'lastEmail' => $lastEmail
        ]);
    }

    #[Route('/deconnexion', name: 'userLogout')]
    public function logout()
    {
    }

    private $entityManager;
    public function __construct(EntityManagerInterface $emi)
    {
        $this->entityManager = $emi;
    }

    #[Route('/user/new', name: 'user.new')]
    public function new(Request $request, UserPasswordHasherInterface $hasher): Response
    {
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $post = $request->get('user');
            $user->addRole($post['role']);
            $psw = $hasher->hashPassword($user, $user->getPassword());
            $user->setPassword($psw);
            // dd($user);

            $this->entityManager->persist($user); //persist signifie vouloir figer les datas de $user
            $this->entityManager->flush();

            return $this->redirectToRoute('user.new');
        }

        return $this->renderForm('login/newForm.html.twig', [
            'newForm' => $form

            //   return $this->render('login/list.html.twig', [
            //       'form' => $form->createView()

        ]);
    }
    #[Route('/user/list', name: 'user.list')]
    public function list(UserRepository $repo): Response
    {
        $users = $repo->findAll();

        return $this->render('login/list.html.twig', [
            'users' => $users
        ]);
    }

    #[Route('user/{id}/edit', name: 'user.edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, User $user, EntityManagerInterface $emi): Response
    {
        //    if ($request->getMethod() === 'POST') {
        //         $email = $request->get('email');
        //         if ($email !== $user->getEmail()) {
        //         $user->setEmail($email);
        //         $emi->flush();

        //         return $this->redirectToRoute('user.list');
        //         }
        //    }
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $emi->flush();

            return $this->redirectToRoute('user.list', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('login/formEdit.html.twig', [
            'user' => $user,
            'form' => $form
        ]);
    }
    #[Route('/{id}', name: 'user.delete', methods: ['POST'])]
    public function delete(Request $request, User $user, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $user->getId(), $request->request->get('_token'))) {
            $entityManager->remove($user);
            $entityManager->flush();
        }

        return $this->redirectToRoute('user.list', [], Response::HTTP_SEE_OTHER);
    }
}
