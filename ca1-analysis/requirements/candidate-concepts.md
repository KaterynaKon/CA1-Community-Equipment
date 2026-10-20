# Candidate-Concept Analysis

## 1. Initial Candidate Extraction

| Candidate term | Evidence source | Initial question / observation |
|---|---|---|
| Equipment | Scenario | Is this one general concept, or should equipment types and physical units be distinguished? |
| Equipment type | Scenario | Does Riverside need to distinguish types such as chairs, projectors and first-aid kits? |
| Equipment unit | Scenario | Does each physical unit need its own condition and availability information? |
| Equipment component | Scenario | Is a component needed because a missing cable or microphone can make a system unusable? |
| Borrower | Scenario | Must the service remember borrower identity and borrowing history? |
| Organisation | Scenario | Is an organisation a borrower type or a separate concept? |
| Contact details | Scenario | Is this an attribute of Borrower or Organisation? |
| Loan request | Scenario | Does it have dates, status, requested equipment and a decision? |
| Request status | Present Process step 5 | Is this a value of Loan Request rather than a class? |
| Requested quantity | Scenario | Is this a number associated with requested equipment? |
| Collection | Present Process step 7 | Is this a recorded transaction with collector and issued equipment? |
| Collector | Present Process step 7 | Is this a role played by a person rather than a separate class? |
| Return | Present Process steps 8-9 | Is this a transaction or a record with a date and inspection outcome? |
| Inspection | Present Process step 9 | Does the organisation need to retain the result of each inspection? |
| Damage | Present Process step 10 | Does damage need its own record, condition and repair information? |
| Repair | Present Process step 10 | Is repair an event or a persistent record? |
| Maintenance need | Present Process step 9 | Is this an attribute of inspection or damage? |
| Deposit | Scenario | Does the organisation need to retain amount, reason and status? |
| Safety inspection | Business Rule BR-01 | Does this need its own date and result history? |
| Extension request | Present Process step 11 | Is this a new request or a change to an existing Loan Request? |
| Equipment status | Scenario | Is this a controlled value such as available, reserved, issued or damaged? |
| Activity | Scenario | Is an activity needed to explain the purpose of a loan request? |
| Grant funding | Coordinator evidence | Must the service identify equipment funded by a grant? |
| Requested equipment line | Scenario: borrowers may request equipment and quantities | Does one record connect one Loan Request, one equipment type and a requested quantity? |
| Staff member | Present Process steps 1-12 | Is staff identity needed because the service records who made a decision, collection or return record? |



## 2. Candidate Classification

| Candidate term | Classification | Reason |
|---|---|---|
| Equipment | Conceptual class | Riverside must retain information about equipment availability, condition, status and loan history. |
| Equipment type | Conceptual class | Types such as chairs, projectors, first-aid kits and public-address equipment may have different rules, instructions or safety requirements. |
| Equipment unit | Conceptual class | An individual physical unit may have its own condition, availability, damage and inspection history. |
| Equipment component | Conceptual class | A component such as a microphone or cable may be missing or damaged and can make an equipment system unusable. |
| Borrower | Conceptual class | Riverside needs to identify the borrower, retain contact information and connect the borrower to requests and loans. |
| Organisation | Possible conceptual class | A borrower may be an organisation, group or business, but it needs clarification whether this should be a separate class or a borrower type. |
| Contact details | Attribute / value | Contact details describe a borrower or organisation; they do not need an independent lifecycle. |
| Loan request | Conceptual class | A request has its own dates, status, requested equipment, quantities and decision outcome. |
| Request status | Attribute / value | Approved, rejected, withdrawn and pending further information are controlled values describing a Loan Request. |
| Requested equipment line | Conceptual class | One Loan Request may contain several equipment types, each with its own requested quantity. |
| Requested quantity | Attribute / value | Quantity is a numeric value describing one requested equipment line. |
| Activity | Attribute / value | The activity explains the purpose of a loan request, but the scenario does not require activities to have an independent lifecycle. |
| Collection | Operation / event | Collection is an action that reveals a possible Collection Record containing issued equipment, collector and collection date. |
| Collector | Role | A collector is a person who receives equipment and may be different from the requester; this is a role, not necessarily a separate class. |
| Return | Operation / event | Return is an action that reveals a possible Return Record with a return date and inspection outcome. |
| Inspection | Conceptual class | Inspection outcomes must retain information about quantity, missing components, cleanliness, safety and maintenance needs. |
| Damage | Conceptual class | Damage has information such as the damaged item, issue found, usability and repair need. |
| Repair | Operation / event | Repair is physical work carried out by staff or an external service; it may later require a Repair Record if repair history is needed. |
| Maintenance need | Attribute / value | A maintenance need is an inspection or damage outcome rather than an independent concept. |
| Deposit | Possible conceptual class | A deposit may have an amount, reason and refund status, but the deposit policy is unresolved. |
| Safety inspection | Conceptual class | Electrical equipment must have a current safety inspection, which may require a date, result and validity information. |
| Extension request | Operation / event | An extension is a requested change to an existing loan request and must be checked against later approved requests. |
| Equipment status | Attribute / value | Available, reserved, issued, damaged and awaiting inspection are controlled values describing equipment. |
| Request decision | Attribute / value | The decision is normally represented by the status and related approval information on a Loan Request. |
| Grant funding | Attribute / value | Grant funding describes the source or category of equipment rather than an independent domain concept. |
| Office Staff member | Actor and possible conceptual class | Office Staff use the service. Retain a Staff Member class only if the service must remember who recorded decisions, collections, returns or inspections. |
| Partnership Coordinator | Actor / organisational role | The coordinator approves some high-value equipment and reviews operational information. It may be a role of Staff Member rather than a separate class. |
| Volunteer | Actor / organisational role | A volunteer records collections or returns with restricted access; it may be a role of Staff Member rather than a separate class. |
| External Repair Service | External organisation / requires clarification | The service performs physical repairs, but it is unclear whether Riverside must retain its identity and repair history. |
| Notification or reminder | Operation / external action | The scenario does not confirm which messages should be automatic or whether notification history must be retained. |
| Activity report | Derived output | Funder reporting uses information derived from requests, collections, returns and equipment records. |
| Spreadsheet | Out of scope / implementation | The shared spreadsheet is part of the current process, not a concept in the future domain model. |
| Telephone and email | Out of scope / communication channel | These are channels through which requests currently arrive, not conceptual classes. |


## 3. Candidate Refinement Decisions

| Candidate term | Decision | Final term / destination | Justification |
|---|---|---|---|
| Equipment | Merge | EquipmentItem | Use one agreed concept for loanable equipment rather than separate overlapping terms. |
| Equipment type | Merge | EquipmentItem.type | Type is a value such as chair, projector or first-aid kit. |
| Equipment unit | Merge | EquipmentItem | The scenario does not clearly require a separate class for every individual unit. |
| Equipment component | Keep | EquipmentComponent | A missing or damaged component can make an equipment system unusable. |
| Borrower | Keep | Borrower | The service must identify borrowers and connect them to requests and loans. |
| Organisation | Merge | Borrower | A group, business or organisation can be represented as a borrower category rather than a separate class. |
| Contact details | Convert | Borrower.contactDetails | Contact details describe a borrower and have no separate lifecycle. |
| Loan request | Keep | LoanRequest | A request has dates, status, requested equipment and a decision outcome. |
| Request status | Convert | LoanRequest.status | Approved, rejected, withdrawn and pending are values describing a request. |
| Requested equipment line | Keep | RequestedEquipmentLine | It links one LoanRequest with one EquipmentItem and a requested quantity. |
| Requested quantity | Convert | RequestedEquipmentLine.quantity | Quantity describes one requested equipment line. |
| Activity | Convert | LoanRequest.activityDescription | The scenario gives no evidence that activities need an independent lifecycle. |
| Collection | Convert | CollectionRecord | Riverside needs to record collection details, including issued equipment and collector. |
| Collector | Convert | CollectionRecord.collectorName | Collector is a role in a collection, not necessarily an independent class. |
| Return | Merge | ReturnInspectionRecord | The return and its inspection are recorded together in the present process. |
| Inspection | Merge | ReturnInspectionRecord | The inspection result belongs to the returned equipment record. |
| Damage | Keep | DamageRecord | Damage needs details about the item, issue, usability and repair need. |
| Repair | Keep | RepairRecord | Repairs may be performed by staff or an external service and can affect equipment readiness. |
| Maintenance need | Convert | ReturnInspectionRecord.maintenanceNeed | A maintenance need is an inspection outcome. |
| Deposit | Keep provisionally | Deposit | A deposit can have an amount, reason and refund status, but the detailed policy is unresolved. |
| Safety inspection | Keep | SafetyInspection | Electrical equipment requires a current safety inspection, with a date and result. |
| Extension request | Keep | ExtensionRequest | An extension has a requested date and must be checked against later approved requests. |
| Equipment status | Convert | EquipmentItem.status | Available, reserved, issued, damaged and awaiting inspection are controlled values. |
| Request decision | Merge | LoanRequest.status | The decision is represented by the request status and coordinator approval where needed. |
| Grant funding | Convert | EquipmentItem.fundingSource | Grant funding describes equipment rather than being an independent concept. |
| Office Staff member | Keep | StaffMember | The service needs to know who records decisions, collections, returns and inspections. |
| Partnership Coordinator | Merge | StaffMember.role | Coordinator is a staff role with approval responsibilities. |
| Volunteer | Merge | StaffMember.role | Volunteer is a staff role with restricted permissions. |
| External Repair Service | Convert | RepairRecord.repairProvider | The repair provider can be recorded as part of a repair rather than becoming a separate core class. |
| Notification or reminder | Requires clarification | U-06 | The scenario does not confirm which notifications are automatic or whether notification history is retained. |
| Activity report | Remove | Derived output | Reports are produced from stored activity information and have no independent lifecycle. |
| Spreadsheet | Remove | Current implementation detail | The spreadsheet belongs to the current process, not the future domain model. |
| Telephone and email | Remove | Communication channels | These are request channels, not conceptual classes. |


## 4. Domain Glossary

| Concept | Concise domain definition | Related concepts | Evidence |
|---|---|---|---|
| Borrower | A person, community group or organisation that requests equipment for an activity. | LoanRequest, Deposit | Scenario; FR-01 |
| StaffMember | A Riverside staff member or authorised volunteer who records or reviews lending activity. A role determines the actions and information available to that person. | LoanRequest, CollectionRecord, ReturnInspectionRecord, SafetyInspection | Present Process steps 1-12; UC-01-UC-07 |
| LoanRequest | A borrower's request to borrow specified equipment for a stated collection and return period. | Borrower, RequestedEquipmentLine, CollectionRecord, ExtensionRequest, Deposit | FR-01; FR-03; UC-01; UC-02 |
| RequestedEquipmentLine | One requested equipment type and quantity within a LoanRequest. | LoanRequest, EquipmentType | Scenario: requested equipment and quantities; FR-01 |
| EquipmentType | A defined category of equipment, such as a chair, projector, first-aid kit or public-address equipment. Equipment types may have different lending, safety or handling requirements. | RequestedEquipmentLine, EquipmentUnit | Scenario; BR-01; BR-02 |
| EquipmentUnit | An individual loanable item or equipment system managed by Riverside. It has a condition and availability status and may be made up of components. | EquipmentType, EquipmentComponent, DamageRecord, SafetyInspection | Scenario; FR-02; FR-10 |
| EquipmentComponent | A physical part required for an EquipmentUnit or equipment system to be usable, such as a microphone or cable. | EquipmentUnit, ReturnInspectionRecord | E-11; P-11; O-11 |
| CollectionRecord | A record that approved equipment was collected, including the collector, issued equipment and the person who recorded the collection. | LoanRequest, StaffMember, EquipmentUnit | Present Process step 7; FR-04; UC-04 |
| ReturnInspectionRecord | A record of returned equipment and the outcome of its inspection, including quantity, missing components, cleanliness, safety and maintenance needs. | CollectionRecord, EquipmentUnit, DamageRecord, StaffMember | Present Process steps 8-9; BR-04; FR-05; FR-10 |
| DamageRecord | A record of damage found on equipment, including the issue identified, whether the equipment remains suitable for use and whether repair is required. | EquipmentUnit, ReturnInspectionRecord, RepairRecord | E-13; FR-07 |
| RepairRecord | A record of repair work required or completed for damaged equipment, whether performed by Riverside staff or an external repair service. | DamageRecord, EquipmentUnit | Present Process step 10; equipment status "under repair" |
| Deposit | A refundable amount associated with a LoanRequest where Riverside requires a deposit. | LoanRequest, Borrower | P-07; O-07; U-03 |
| SafetyInspection | A safety check for electrical equipment that records whether the equipment has a current inspection and remains suitable for loan. | EquipmentUnit, StaffMember | BR-01; FR-08 |
| ExtensionRequest | A request to change the agreed return date of an existing LoanRequest. | LoanRequest, StaffMember | Present Process step 11; BR-05; FR-06 |


## 5. Suggested Final Candidate List

The following conceptual classes are selected for the initial Riverside domain model:

1. Borrower
2. StaffMember
3. LoanRequest
4. RequestedEquipmentLine
5. EquipmentType
6. EquipmentUnit
7. EquipmentComponent
8. CollectionRecord
9. ReturnInspectionRecord
10. DamageRecord

