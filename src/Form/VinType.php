<?php

namespace App\Form;

use App\Entity\Vin;
use App\Entity\Region;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class VinType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom', TextType::class, [
                'label' => 'Nom du vin'

            ])
            ->add('millesime', IntegerType::class, [
                'label' => 'Entrez le millésime du vin'
            ])
            ->add('robe', ChoiceType::class, [
                'label' => 'Choisir la robe du vin',
                'choices' => [
                    'Robe rouge' => 'Vin rouge',
                    'Robe blanche' => 'Vin blanc',
                    'Robe rose' => 'Vin rosé',
                ]
            ])
            ->add('qte_stock', IntegerType::class, [
                'label' => 'Saisir la quantité',
                'data' => 1
            ])
            ->add('contenance', TextType::class, [
                'label' => 'Saisir la contenance'
            ])
            ->add('remarques', TextareaType::class, [
                'label' => 'Saisir des infos pratiques (facultatif)',
                'required' => false,
                'constraints' => new Length([
                    'min' => 0,
                    'max' => 600
                ])
            ])
            ->add('region', EntityType::class, [
                'class' => Region::class,
                'choice_label' => 'region'
            ])
           
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Vin::class,
        ]);
    }
}
