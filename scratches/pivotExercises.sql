create database pivotExercises;

use pivotExercises;

CREATE table sampleTable1
    ([Id] int, [Value] varchar(6), [ColumnName] varchar(13))
;
    
INSERT INTO sampleTable1
    ([Id], [Value], [ColumnName])
VALUES
    (1, 'John', 'FirstName'),
    (2, '2.4', 'Amount'),
    (3, 'ZH1E4A', 'PostalCode'),
    (4, 'Fork', 'LastName'),
    (5, '857685', 'AccountNumber')
;

select * from sampletable1;

select Firstname, Amount, PostalCode, LastName, AccountNumber
from
(
  select value, columnname
  from sampleTable1
) d
pivot
(
  max(value)
  for columnname in (Firstname, Amount, PostalCode, LastName, AccountNumber)
) piv;

create table sourceData
([CrmLobTriID] int, [MajorLob] varchar(20), [LobInfo] varchar(20), [TriangleType] varchar(20), [PeriodType] varchar(8), [Mth] int, [Ldfs] float);

drop table sourceData;

select * from sourcedata;

select CrmLobTriId, Mth, row_number() over (partition by crmlobtriid order by mth) as rid
from sourcedata;

select [CrmLobTriID], [MajorLob], [LobInfo], [TriangleType], [PeriodType], indicator, amount, rid
from (
select [CrmLobTriID], [MajorLob], [LobInfo], [TriangleType], [PeriodType], 'mth' as indicator, mth as amount, row_number() over (partition by crmlobtriid order by mth) as rid
from sourcedata
union all
select [CrmLobTriID], [MajorLob], [LobInfo], [TriangleType], [PeriodType], 'ldfs' as indicator, ldfs as amount, row_number() over (partition by crmlobtriid order by mth) as rid
from sourcedata
) as tempunion

select * from
(
    select [CrmLobTriID], [MajorLob], [LobInfo], [TriangleType], [PeriodType], indicator, amount, rid
    from
    (
        select [CrmLobTriID], [MajorLob], [LobInfo], [TriangleType], [PeriodType], 'mth' as indicator,
        mth as amount, 'mth' + cast(row_number() over (partition by crmlobtriid order by mth) as varchar) as rid
        from sourcedata
        union all
        select [CrmLobTriID], [MajorLob], [LobInfo], [TriangleType], [PeriodType], 'ldfs' as indicator, ldfs as amount,
        'mth' + cast(row_number() over (partition by crmlobtriid order by mth) as varchar) as rid
        from sourcedata
    ) as tempunion
) as tempall
pivot
(
    max(amount)
    for rid in
    ([mth1], [mth2], [mth3], [mth4], [mth5], [mth6], [mth7], [mth8], [mth9], [mth10],
    [mth11], [mth12], [mth13], [mth14], [mth15], [mth16], [mth17], [mth18], [mth19], [mth20])
) piv
order by [CrmLobTriID] desc, indicator desc;

select * from
(
select [CrmLobTriID], [MajorLob], [LobInfo], [TriangleType], [PeriodType], indicator, amount, rid
from
(
select [CrmLobTriID], [MajorLob], [LobInfo], [TriangleType], [PeriodType], 'mth' as indicator, mth as amount, row_number() over (partition by crmlobtriid order by mth) as rid
from sourcedata
union all
select [CrmLobTriID], [MajorLob], [LobInfo], [TriangleType], [PeriodType], 'ldfs' as indicator, ldfs as amount, row_number() over (partition by crmlobtriid order by mth) as rid
from sourcedata
) as tempunion
) as tempall
pivot
(
max(amount)
for rid in ([1], [2])
) piv;