#!/usr/bin/env python3
"""AProd web page and API."""

from falcon import API, HTTP_400
from pymysql import connect
from pymysql.cursors import DictCursor

DBH = connect(host='localhost',
              database='aprod',
              user='aprod',
              password='Xiejohpa8liamaceew3paeCa',
              charset='utf8mb4',
              autocommit=True,
              cursorclass=DictCursor)

QUERIES = {
    'discount_percent':
    """\
        select discount_percent
        from   coupons
        where  name = %s
    """,
    'products':
    """\
        select c.name as "Category", a.name as "Artist", p.name as "Product",
               price as "Price"
        from   categories c inner join products p on(c.id = p.cid)
                            inner join artists  a on(a.id = p.aid)
    """
}


class AProd:
    """AProd API."""
    def on_post(self, req, resp):
        """POST handler for AProd API endpoint."""
        category = req.media.get('category')
        artist = req.media.get('artist')
        product = req.media.get('product')
        coupon = req.media.get('coupon')

        if not (coupon and (category or artist or product)):
            resp.status = HTTP_400
            return

        DBH.ping(reconnect=True)

        with DBH.cursor() as cur:
            cur.execute(QUERIES['discount_percent'], (coupon))
            discount_percent = (cur.fetchone()
                                or dict()).get('discount_percent', 0)

        with DBH.cursor() as cur:
            p_where = []
            p_where_params = []
            if category:
                p_where.append(' c.name = %s ')
                p_where_params.append(category)
            if artist:
                p_where.append(' a.name = %s ')
                p_where_params.append(artist)
            if product:
                p_where.append(' p.name = %s ')
                p_where_params.append(product)

            cur.execute(
                QUERIES['products'] + ' where ' + ' and '.join(p_where),
                tuple(p_where_params))

            products = cur.fetchall()

        for prod in products:
            prod['Price'] -= prod['Price'] * (discount_percent / 100)

        resp.media = products


APP = API()
APP.add_route('/', AProd())
