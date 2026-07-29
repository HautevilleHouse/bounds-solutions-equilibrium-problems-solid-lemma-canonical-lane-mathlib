import BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean.AdmissibleClass

/-!
# Equilibrium Existence Package
-/

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure EquilibriumExistencePackage where
  convexCompactDomain : Prop
  continuousUplift : Prop
  fixedPointExists : Prop
  equilibriumSelected : Prop

structure EquilibriumExistenceEvidence (P : EquilibriumExistencePackage) where
  convexCompactDomainClosed : P.convexCompactDomain
  continuousUpliftClosed : P.continuousUplift
  fixedPointExistsClosed : P.fixedPointExists
  equilibriumSelectedClosed : P.equilibriumSelected

def EquilibriumExistenceClosed (P : EquilibriumExistencePackage) : Prop :=
  P.convexCompactDomain ∧ P.continuousUplift ∧ P.fixedPointExists ∧ P.equilibriumSelected

theorem equilibrium_existence_closed_from_evidence (P : EquilibriumExistencePackage)
    (E : EquilibriumExistenceEvidence P) : EquilibriumExistenceClosed P := by
  exact And.intro E.convexCompactDomainClosed
    (And.intro E.continuousUpliftClosed
      (And.intro E.fixedPointExistsClosed E.equilibriumSelectedClosed))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse