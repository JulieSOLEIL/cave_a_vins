<?php

namespace App\Entity;

use App\Repository\RegionRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: RegionRepository::class)]
class Region
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 50)]
    private $region;

    #[ORM\OneToMany(mappedBy: 'region', targetEntity: Vin::class)]
    private $vins;

    public function __construct()
    {
        $this->vins = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getRegion(): ?string
    {
        return $this->region;
    }

    public function setRegion(string $region): self
    {
        $this->region = $region;

        return $this;
    }

    /**
     * @return Collection|Vin[]
     */
    public function getVins(): Collection
    {
        return $this->vins;
    }

    public function addVin(Vin $vin): self
    {
        if (!$this->vins->contains($vin)) {
            $this->vins[] = $vin;
            $vin->setRegion($this);
        }

        return $this;
    }

    public function removeVin(Vin $vin): self
    {
        if ($this->vins->removeElement($vin)) {
            // set the owning side to null (unless already changed)
            if ($vin->getRegion() === $this) {
                $vin->setRegion(null);
            }
        }

        return $this;
    }
}
