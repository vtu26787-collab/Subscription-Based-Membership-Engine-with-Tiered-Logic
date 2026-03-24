const mysql = require('mysql2');
const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'kishor15',
    database: 'subscription_engine'
});

const getUsers = () => {
    const query = `
    SELECT u.id, u.name, u.email, u.role, u.created_at, p.plan_name 
    FROM users u 
    LEFT JOIN subscriptions s ON u.id = s.user_id AND s.status = 'active'
    LEFT JOIN plans p ON s.plan_id = p.id
    ORDER BY u.created_at DESC
  `;
    con.query(query, (err, res) => {
        console.log('--- USERS ---');
        console.log(err || res);
        getRevenue();
    });
};

const getRevenue = () => {
    con.query('SELECT SUM(amount) as total_revenue FROM payments', (err, resultsTotal) => {
        if (err) {
            console.log('REVENUE TOTAL ERROR:', err);
            con.end();
            return;
        }
        const totalRevenue = resultsTotal[0].total_revenue || 0;
        const query = `
      SELECT 
        DATE_FORMAT(payment_date, '%M %Y') as month,
        SUM(amount) as revenue
      FROM payments 
      WHERE payment_date >= DATE_SUB(LAST_DAY(NOW()), INTERVAL 6 MONTH)
      GROUP BY YEAR(payment_date), MONTH(payment_date), DATE_FORMAT(payment_date, '%M %Y')
      ORDER BY YEAR(payment_date) ASC, MONTH(payment_date) ASC
    `;
        con.query(query, (err, resultsHistory) => {
            console.log('--- REVENUE ---');
            if (err) console.log('REVENUE HISTORY ERROR:', err);
            else console.log({ total_revenue: totalRevenue, history: resultsHistory });
            con.end();
        });
    });
};

getUsers();
