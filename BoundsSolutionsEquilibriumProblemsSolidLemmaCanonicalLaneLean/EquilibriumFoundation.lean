import BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean.SolidLemma

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure EquilibriumFoundationPackage {V : VariationalInequalityPackage}
    {M : MonotoneOperatorPackage V} {S : SaddlePointPackage M}
    (L : SolidLemmaPackage S) where
  equilibriumExistence : Prop
  equilibriumUniqueness : Prop
  equilibriumStability : Prop

structure EquilibriumFoundationEvidence {V : VariationalInequalityPackage}
    {M : MonotoneOperatorPackage V} {S : SaddlePointPackage M}
    {L : SolidLemmaPackage S} (E : EquilibriumFoundationPackage L) where
  equilibriumExistenceClosed : E.equilibriumExistence
  equilibriumUniquenessClosed : E.equilibriumUniqueness
  equilibriumStabilityClosed : E.equilibriumStability

def EquilibriumFoundationClosed {V : VariationalInequalityPackage}
    {M : MonotoneOperatorPackage V} {S : SaddlePointPackage M}
    {L : SolidLemmaPackage S} (E : EquilibriumFoundationPackage L) : Prop :=
  E.equilibriumExistence ∧ E.equilibriumUniqueness ∧ E.equilibriumStability

theorem equilibrium_foundation_closed_from_evidence
    {V : VariationalInequalityPackage} {M : MonotoneOperatorPackage V}
    {S : SaddlePointPackage M} {L : SolidLemmaPackage S}
    (E : EquilibriumFoundationPackage L)
    (Ev : EquilibriumFoundationEvidence E) : EquilibriumFoundationClosed E := by
  exact And.intro Ev.equilibriumExistenceClosed
    (And.intro Ev.equilibriumUniquenessClosed Ev.equilibriumStabilityClosed)

end HautevilleHouse
end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean