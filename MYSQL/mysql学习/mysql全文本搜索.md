**myIsam支持全文本搜索，而innndb不支持全文本搜索**

就是全文索引

    ##创建全文本搜索
    mysql> create fulltext index goods_desc_index on goods (goods_desc);

给过程也可以在建表时创建全文索引

全文索引可以索引单列，也可以索引多列

#执行全文本搜索

使用SELECT 结合MATCH() 函数和AGAINST()函数
MATCH()指定被搜索的列即全文索引列，AGAINST指定要使用的搜索表达式

全文搜索会对结果行进行排序

match-------against 返回搜索结果的等级值，这通过一定的公式计算得出，当没有匹配时索引值为0

因此可以将这个函数用在where的左边作为返回的列


###使用查询扩展

###布尔文本搜索
**目前来看全文搜索在汉语中不能用**