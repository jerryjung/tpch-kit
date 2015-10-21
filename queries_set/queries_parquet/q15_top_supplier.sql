insert overwrite table revenue
select 
  l_suppkey as supplier_no, sum(l_extendedprice * (1 - l_discount)) as total_revenue
from 
  p_lineitem
where 
  l_shipdate >= '1996-01-01' and l_shipdate < '1996-04-01'
group by l_suppkey;

insert overwrite table max_revenue
select 
  max(total_revenue)
from 
  revenue;

select 
  s_suppkey, s_name, s_address, s_phone, total_revenue
from p_supplier s join revenue r 
  on 
    s.s_suppkey = r.supplier_no
  join max_revenue m 
  on 
    r.total_revenue = m.max_revenue
order by s_suppkey;

