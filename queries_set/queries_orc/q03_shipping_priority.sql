select 
  l_orderkey, sum(l_extendedprice*(1-l_discount)) as revenue, o_orderdate, o_shippriority 
from 
  o_customer c join o_orders o 
    on c.c_mktsegment = 'BUILDING' and c.c_custkey = o.o_custkey 
  join o_lineitem l 
    on l.l_orderkey = o.o_orderkey
where 
  o_orderdate < '1995-03-15' and l_shipdate > '1995-03-15' 
group by l_orderkey, o_orderdate, o_shippriority 
order by revenue desc, o_orderdate 
limit 10;

