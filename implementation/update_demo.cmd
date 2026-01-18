[main>>kb].

demo_emp:employee @ kb.
demo_req:leaveRequest @ kb.
demo_contract:contract @ kb.
demo_mismatch:employee @ kb.

insert{
  demo_emp:employee[
    empId->1998, firstName->Demo, lastName->Employee,
    worksIn->restaurant, holdsPos->waiter_pos,
    employmentType->full_time,
    hireYear->2026, yearsOfService->1,
    isActive->yes,
    baseSalaryEUR->1000, leaveUsed->0
  ] @ kb
}.

insert{
  demo_contract:contract[
    forEmployee->demo_emp,
    status->active,
    startYear->2026, endYear->0
  ] @ kb
}.

insert{ demo_emp[hasContract->demo_contract] @ kb }.

insert{
  demo_req:leaveRequest[
    submittedBy->demo_emp,
    year->2026,
    days->1,
    status->Pending
  ] @ kb
}.

demo_req:leaveRequest[submittedBy->?E, status->?S] @ kb.

demo_req:leaveRequest[status->Pending],
demo_req[status->Approved, approvedBy->?A] @ kb.

insert{
  demo_mismatch:employee[
    empId->1999, firstName->Demo, lastName->Mismatch,
    worksIn->kitchen, holdsPos->bartender_pos,
    employmentType->full_time,
    hireYear->2026, yearsOfService->1,
    isActive->yes,
    baseSalaryEUR->1000, leaveUsed->0
  ] @ kb
}.


violation(positionDepartmentMismatch, ?E) @ kb.

delete{ demo_req:leaveRequest @ kb }.
delete{ demo_emp[hasContract->demo_contract] @ kb }.
delete{ demo_contract:contract @ kb }.
delete{ demo_emp:employee @ kb }.
delete{ demo_mismatch:employee @ kb }.

demo_emp:employee @ kb.
demo_req:leaveRequest @ kb.
demo_contract:contract @ kb.
demo_mismatch:employee @ kb.

halt.

