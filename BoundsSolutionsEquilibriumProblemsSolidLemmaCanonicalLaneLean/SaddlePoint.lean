import BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean.MonotoneOperator

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure SaddlePointPackage {V : VariationalInequalityPackage}
    {M : MonotoneOperatorPackage V} where
  lagrangianDefined : Prop
  saddleExistence : Prop
  primalDualEquivalence : Prop
  stabilityUnderPerturbation : Prop

structure SaddlePointEvidence {V : VariationalInequalityPackage}
    {M : MonotoneOperatorPackage V}
    (S : SaddlePointPackage M) where
  lagrangianDefinedClosed : S.lagrangianDefined
  saddleExistenceClosed : S.saddleExistence
  primalDualEquivalenceClosed : S.primalDualEquivalence
  stabilityUnderPerturbationClosed : S.stabilityUnderPerturbation

def SaddlePointClosed {V : VariationalInequalityPackage}
    {M : MonotoneOperatorPackage V} (S : SaddlePointPackage M) : Prop :=
  S.lagrangianDefined ∧ S.saddleExistence ∧ S.primalDualEquivalence ∧ S.stabilityUnderPerturbation

theorem saddle_point_closed_from_evidence
    {V : VariationalInequalityPackage} {M : MonotoneOperatorPackage V}
    (S : SaddlePointPackage M) (E : SaddlePointEvidence S) : SaddlePointClosed S := by
  exact And.intro E.lagrangianDefinedClosed
    (And.intro E.saddleExistenceClosed
      (And.intro E.primalDualEquivalenceClosed E.stabilityUnderPerturbationClosed))

end HautevilleHouse
end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean