import express from "express";
import cors from "cors";
import { Pool } from "pg";
const client = new Pool({
    "host": "localhost",
    "port": 5432,
    "database": "CompanyTeamsManagement",
    "user": "postgres",
    "password": "kozel77"
});
const app = express();

app.use(express.json());
app.use(cors());
app.use(express.urlencoded({ extended: true }));


app.get('/filter-employees', async (req, res) => {

    let { years, country } = req.query;
    years = years as string;

    await client.query(` SELECT  STRING_AGG("first_name"||' '||"last_name", ', ') AS "workers" , companies.country
        FROM main.employees
        join main.teams on employees.team_id=teams.id
        join main.companies on teams.company_id=companies.id
        WHERE ( DATE_PART('year', CURRENT_DATE) - DATE_PART('year', "starDate")) >$1
        and country=$2  
        group by "country"`, [years, country], (err: any, data: any) => {
        if (!err) {
            res.json(data.rows);

        } else {
            console.log(err);
        }
    });
});

app.get('/team-info', async (req, res) => {

    let { team } = req.query;

    await client.query(`SELECT   teams.name as team_name, STRING_AGG("first_name"||' '||"last_name"||' '||'id: '||employees.id, ', ') AS "team_mates", manager_id
    FROM main.employees
    join main.teams on employees.team_id=teams.id
    where teams.name=$1
    group by team_name,"manager_id"`, [team], (err: any, data: any) => {
        if (!err) {
            res.json(data.rows);
        } else {
            console.log(err);
        }
    });
});
app.get('/avg-salary', async (req, res) => {

    await client.query(`SELECT teams.department,AVG(employees.salary) AS avg_salary
               FROM main.employees
                   join main.teams on employees.team_id=teams.id
                   group by teams.department`, (err: any, data: any) => {
        if (!err) {
            res.json(data.rows);

        } else {
            console.log(err);
        }
    });

});
app.get('/companies/employees', async (req, res) => {

    let { company } = req.query;

    await client.query(`SELECT count ("company_id") as emp_count ,   STRING_AGG("first_name"||' '||"last_name", ', ') AS "workers"
	FROM main.employees
		join main.teams on employees.team_id=teams.id
	join main.companies on teams.company_id=companies.id
	WHERE (( DATE_PART('year', CURRENT_DATE) - DATE_PART('year', "starDate")) * 12 + (DATE_PART('month', CURRENT_DATE) - DATE_PART('month', "starDate")))>=6 
	and companies.name=$1`, [company], (err: any, data: any) => {
        if (!err) {
            res.json(data.rows);
        } else {
            console.log(err);
        }
    });
});
app.post("/companies", async (req, res) => {
    const { name, country } = req.body;

    client.query(`INSERT INTO main.companies(name, country)
       VALUES ($1,$2) RETURNING *`, [name, country], (error, results) => {
        if (error) {
            throw error;
        }
        res.json(results.rows);
    });
});
app.get("/companies", async (req, res) => {

    let { companyName } = req.query;
    await client.query(`SELECT *
        FROM main.companies
    WHERE companies.name=$1`, [companyName], (err, results) => {
        if (err) {
            throw err;
        }
        res.json(results.rows);
    });

});

app.put('/companies', async (req, res) => {
    const companyName = req.body.companyName
    const { name, country } = req.body;

    client.query(`UPDATE main.companies
	SET  name=$1, country=$2
	WHERE "name"=$3`, [name, country, companyName], (err, results) => {
        if (err) {
            throw err;
        }
        res.json(results.rows);
    });
});

app.delete('/companies', async (req, res) => {
    let { name } = req.query;

    client.query('DELETE  FROM main.companies WHERE "name"= $1', [name], (err, results) => {
        if (err) {
            throw err;
        }
        res.send(`User deleted with ID: ${name}`);
    });
});

app.get("/employees", async (req, res) => {

    let { name } = req.query;

    await client.query(`SELECT STRING_AGG("first_name"||' '||"last_name", ', ') AS "employees"
	FROM main.employees
	join main.teams on employees.team_id=teams.id
	join main.companies on teams.company_id=companies.id
	where companies.name=$1`, [name], (err, results) => {
        if (err) {
            throw err;
        }
        res.json(results.rows);
    });
});

app.put('/employees', async (req, res) => {

    const { companyName, username, firstName, lastName, oldUsername, email } = req.body;
    const {position,salary, teamId,managerId}=req.query;
    client.query(`UPDATE main.employees
 	SET "position"=$1, salary=$2, team_id=$3, first_name=$4, last_name=$5, username=$6, "e-mail"=$7, manager_id= $8
 	from main.companies
	WHERE companies.name=$9 and employees.username=$10`, [position, salary, teamId, firstName, lastName, username, email, managerId, companyName, oldUsername], (err, results) => {
        if (err) {
            throw err;
        }
        res.json(results.rows);
    });
});

app.post('/employees', async (req, res) => {
    let {  firstName, lastName, username, email } = req.body;
    // startDate=Date.UTC(startDate);
    let {position,salary,teamId,managerId}=req.query;
    await client.query(`INSERT INTO main.employees("position", salary, "starDate", team_id, first_name, last_name, username, "e-mail", manager_id)
        VALUES ($1, $2, CURRENT_DATE, $3, $4, $5, $6, $7, $8)`, [position, salary, teamId, firstName, lastName, username, email, managerId], (error, results) => {
        if (error) {
            throw error;
        }
        res.json(results.rows);
    });
});

app.delete('/employees', async (req, res) => {
    let { username } = req.query;
    //let name:string=req.body.name;
    client.query(`DELETE FROM main.employees WHERE employees.username= $1`, [username], (err, results) => {
        if (err) {
            throw err;
        }
        res.send(`User deleted with ID: ${username}`);
    });
});


app.listen(4000, () => {
    console.log('The application is listening on port 4000!');
});

export { }