[main>>kb].

(?D:department) @ kb.

(?M:manager) @ kb.

topManagement(?E) @ kb.

(?D:department[hasManager->?M]) @ kb.

(?D:department, \+ (?D[hasManager->?AnyMgr])) @ kb.

violation(departmentWithoutManager, ?R) @ kb.

violation(multipleActiveContracts, ?E) @ kb.

violation(studentLeaveNotAllowed, ?R) @ kb.

violation(studentContractMustHaveEndYear, ?C) @ kb.

violation(studentCannotBeManager, ?E) @ kb.

violation(wrongLeaveApprover, ?R) @ kb.

directorActive @ kb.

(ivana[
  leaveEntitlement->?Ent,
  leaveRemaining->?Rem,
  bonusPercent->?BP,
  bonusAmount->?BA
]) @ kb.

(student_lana[
  leaveEntitlement->?Ent,
  bonusPercent->?BP,
  bonusAmount->?BA
]) @ kb.

(?R:leaveRequest[status->Pending],
 ?R[status->Approved, approvedBy->?A]) @ kb.
 
 (petra[
  bonusPercent->?BP,
  bonusAmount->?BA
]) @ kb.

violation(positionDepartmentMismatch, ?E) @ kb.

violation(leaveRequestNoActiveContract, ?R) @ kb.

violation(leaveRequestExceedsRemaining, ?R) @ kb.

violation(leaveUsedExceedsEntitlement, ?E) @ kb.

violation(managerNotEligible, ?D) @ kb.

(petra[bonusPercent->?BP, bonusAmount->?BA]) @ kb.
(marko[bonusPercent->?BP, bonusAmount->?BA]) @ kb.
(ana[leaveEntitlement->?Ent, leaveRemaining->?Rem]) @ kb.


halt.
