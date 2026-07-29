import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

structure ObstacleProblemPackage where
  obstacleFunction : Type u
  variationalInequality : Prop
  existenceOfSolution : Prop
  regularityOfSolution : Prop
  contactSetStructure : Prop

structure ObstacleProblemEvidence (O : ObstacleProblemPackage) where
  variationalInequalityClosed : O.variationalInequality
  existenceOfSolutionClosed : O.existenceOfSolution
  regularityOfSolutionClosed : O.regularityOfSolution
  contactSetStructureClosed : O.contactSetStructure

def ObstacleProblemClosed (O : ObstacleProblemPackage) : Prop :=
  O.variationalInequality ∧ O.existenceOfSolution ∧ O.regularityOfSolution ∧ O.contactSetStructure

theorem obstacle_problem_closed_from_evidence (O : ObstacleProblemPackage)
    (E : ObstacleProblemEvidence O) : ObstacleProblemClosed O := by
  exact And.intro E.variationalInequalityClosed
    (And.intro E.existenceOfSolutionClosed
      (And.intro E.regularityOfSolutionClosed E.contactSetStructureClosed))

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse