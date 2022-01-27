<?php

namespace App\Controller;

use App\Repository\VinRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    
    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    #[Route('/', name: 'home')]
    public function home(VinRepository $vin_repo): Response
    {
        // $stockTotal = $vin_repo->nbrVinEnCave();

        // $stockByRed = $vin_repo->nbrVinEnCaveParRobe('vin rouge');
        // $stockByWhite = $vin_repo->nbrVinEnCaveParRobe('vin blanc');
        // $stockByRose = $vin_repo->nbrVinEnCaveParRobe('vin rose');
        $stocks = $vin_repo->stock();

        return $this->render('home/home.html.twig', [
            'stocks' => $stocks
            // 'nbr_vins_total' => $stockTotal,
            // 'nbr_vins_rouge' => $stockByRed,
            // 'nbr_vins_blanc' => $stockByWhite,
            // 'nbr_vins_rose' => $stockByRose,
    ]);
    }
}
