import BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BoundsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure BoundsAdmittedObject where
  space : BoundsSpace
  convexCompactSet : Prop
  equilibriumExists : Prop
  solutionSet : Type
  solutionTopology : TopologicalSpace solutionSet
  solutionNonempty : Prop
  conclusion : solutionNonempty

structure BoundsEndgameState where
  object : BoundsAdmittedObject

def BoundsWitnessClosed (O : BoundsAdmittedObject) : Prop :=
  O.solutionNonempty

end BoundsSolutionsEquilibriumProblemsSolidLemmaCanonicalLaneLean
end HautevilleHouse