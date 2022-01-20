<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    
    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    #[Route('/', name: 'home')]
    public function home(): Response
    {
        return $this->render('home/home.html.twig');
    }
}
