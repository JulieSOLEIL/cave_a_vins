<?php

namespace App\Controller;

use App\Entity\Vin;
use App\Form\VinType;
use Doctrine\ORM\Mapping\Id;
use App\Repository\VinRepository;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[IsGranted('ROLE_ADMIN')]
class VinController extends AbstractController
{
    #[Route('/vin/list', name: 'vin.list', methods: ['GET'])]
    public function list(VinRepository $vinRepository): Response
    {
        return $this->render('vin/list.html.twig', [
            'vins' => $vinRepository->findAll(),
        ]);
    }

    // #[Route('/vin/show/{id}', name: 'vin.show')]
    // public function show(Vin $vin): Response
    // {
    //     return $this->render(
    //         'vin/show.html.twig',
    //         [
    //             'vin' => $vin
    //         ]
    //     );
    // }

    #[Route('/vin/new', name: 'vin.new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $vin = new Vin();
        $form = $this->createForm(VinType::class, $vin);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($vin);
            $entityManager->flush();

            return $this->redirectToRoute('vin.list', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('vin/new.html.twig', [
            'vin' => $vin,
            'form' => $form, 
        ]);
    }

    #[Route('/vin/show/{id}', name: 'vin.show')]
    public function show(Vin $vin): Response
    {

        return $this->render(
            'vin/show.html.twig',
            [
                'vin' => $vin
            ]
        );
    }

}   

