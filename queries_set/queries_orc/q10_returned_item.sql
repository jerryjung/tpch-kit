select 
  c_custkey, c_name, sum(l_extendedprice * (1 - l_discount)) as revenue, 
  c_acctbal, n_name, c_address, c_phone, c_comment
from
  o_customer c join o_orders o 
  on 
    c.c_custkey = o.o_custkey and o.o_orderdate >= '1993-10-01' and o.o_orderdate < '1994-01-01'
  join o_nation n 
  on 
    c.c_nationkey = n.n_nationkey
  join o_lineitem l 
  on 
    l.l_orderkey = o.o_orderkey and l.l_returnflag = 'R'
group by c_custkey, c_name, c_acctbal, c_phone, n_name, c_address, c_comment 
order by revenue desc 
limit 20;

