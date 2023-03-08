import React, { useEffect, useState } from 'react';
import './App.css';
import axios from 'axios';
//import { spawn } from 'child_process';

const App = () => {
  const [value, setValue] = useState<string>("");
  const [country, setCountry] = useState<string>("");

  const handleChangeName = (e: React.ChangeEvent<HTMLInputElement>) => {
    setValue(e.target.value);
  }
  const handleChangeCountry = (e: React.ChangeEvent<HTMLInputElement>) => {
    setCountry(e.target.value);
  }
  const handleSave = () => {
    axios.post("http://localhost:4000/companies", { name: value, country: country })
      .then(
        res => {
          if (res.status === 200) {
            alert("success");
          }
        }
      )
      .catch(
        err => { alert("error") }
      )
  }

  const [salaries, setSelary] = useState<Array<{ department: number, avg_salary: number }>>([]);

  useEffect(() => {
    axios.get("http://localhost:4000/avg-salary")
      .then(res => {
        if (res.status === 200) {
          setSelary(res.data)
        }
      })
  }, []);

  const [years, setYears] = useState<string>('');
  const [enterCountry, setEnterCountry] = useState<string>("");

  const handleChangeYears = (e: React.ChangeEvent<HTMLInputElement>) => {
    setYears(e.target.value);
  }
  const handleChangeEnterCountry = (e: React.ChangeEvent<HTMLInputElement>) => {
    setEnterCountry(e.target.value);
  }

  const [filterEmp, setFilterEmp] = useState<Array<{ workers: string, country: string }>>([]);

  const handleFilter = () => {
    axios.get(`http://localhost:4000/filter-employees?years=${years}&country=${enterCountry}`)
      .then(res => {
        if (res.status === 200) {
          setFilterEmp(res.data)
        }
      });
  }

  const [teamName, setTeamName] = useState<string>('');
  const handleChangeTeam = (e: React.ChangeEvent<HTMLInputElement>) => {
    setTeamName(e.target.value);
  }

  const [getTeam, setGetTeam] = useState<Array<{ team_name: string, team_mates: string, manager_id: number }>>([]);
  const handleTeam = () => {
    axios.get(`http://localhost:4000/team-info?team=${teamName}`)
      .then(
        res => {
          if (res.status === 200) {
            setGetTeam(res.data);
          }
        })
  }

  const [companyName, setCompanyName] = useState<string>('');
  const handleChangeCompanyName = (e: React.ChangeEvent<HTMLInputElement>) => {
    setCompanyName(e.target.value);
  }

  const [getCompany, setGetCompany] = useState<Array<{ emp_count: number, workers: string }>>([])
  const handleCompany = () => {
    axios.get(`http://localhost:4000/companies/employees?company=${companyName}`)
      .then(res => {
        if (res.status === 200) {
          setGetCompany(res.data);
        }
      }).catch(err => alert('error updating'));
  }
  const [searchCompany, setSearchCompany] = useState<string>('');
  const handleChangeSearch = (e: React.ChangeEvent<HTMLInputElement>) => {
    setSearchCompany(e.target.value);
  }
  const [getSerachedCompany, setGetSearchCompany] = useState<Array<{ id: number, name: string, country: string }>>([]);

  const handleCompanySearch = () => {
    axios.get(`http://localhost:4000/companies?companyName=${searchCompany}`)
      .then(res => {
        if (res.status === 200) {
          setGetSearchCompany(res.data);
        }
      })
      .catch(err => { alert("Company does not exist") })
  }
  const [companyToUpdate, setCompanyToUpdate] = useState<string>('');
  const handleCompanyToUpdate = (e: React.ChangeEvent<HTMLInputElement>) => {
    setCompanyToUpdate(e.target.value);
  }
  const [companyNameToPut, setNameToPut] = useState<string>('');
  const handleNameToPut = (e: React.ChangeEvent<HTMLInputElement>) => {
    setNameToPut(e.target.value);
  }
  const [countryToPut, setCountryToPut] = useState<string>('');
  const handleCountryToPut = (e: React.ChangeEvent<HTMLInputElement>) => {
    setCountryToPut(e.target.value);
  }

  const handleCompanyPut = () => {
    axios.put(`http://localhost:4000/companies`, { companyName: companyToUpdate, name: companyNameToPut, country: countryToPut })
      .then(res => {
        if (res.status === 200) {
          alert('success')
        }
      })
      .catch(err => { alert('error') });
  }

  const [companyToDelete, setCompanyToDelete] = useState<string>('');
  const handleCompanyNameToDelete = (e: React.ChangeEvent<HTMLInputElement>) => {
    setCompanyToDelete(e.target.value);
  }
  const handleCompanyDetele = () => {
    axios.delete(`http://localhost:4000/companies?name=${companyToDelete}`)
      .then(
        res => {
          if (res.status === 200) {
            alert('success')
          }
        }
      ).catch(
        err => { alert('error') }
      )
  }

  const [getEmpsByCompany, setGetEmpsByCompany] = useState<string>('');
  const handleEmpsByCompany = (e: React.ChangeEvent<HTMLInputElement>) => {
    setGetEmpsByCompany(e.target.value);
  }
  // const handleEmpsSearch=()=>{
  //   axios.get(`http://localhost:4000/employees?name=${getEmpsByCompany}`)
  //   .then(res=>{
  //     if (res.status===200) {
  //       setGetEmpsByCompany(res.data);
  //     }
  //   })
  // }
  const [dissplayEmps, setDisplayEpms] = useState<Array<{ employees: string }>>([]);
  const handleEmpsDisplay = () => {
    axios.get(`http://localhost:4000/employees?name=${getEmpsByCompany}`).then(
      res => {
        if (res.status === 200) {
          setDisplayEpms(res.data);
        }
      }
    )
  }

  const [empToDelete, setEmpToDelete] = useState<string>('');
  const handleDelEmpName = (e: React.ChangeEvent<HTMLInputElement>) => {
    setEmpToDelete(e.target.value);
  }
  const handleEmpDelete = () => {
    axios.delete(`http://localhost:4000/employees?username=${empToDelete}`).then(res => {
      if (res.status === 200) {
        alert('success');
      }
    }).catch(err => { alert('error deleting employee') });
  }

  const [insertEmpPos, setInsertEmpPos] = React.useState<number | string>();
  const handleInsEmpPos = (e: React.ChangeEvent<HTMLInputElement>) => {
    setInsertEmpPos(parseInt(e.target.value));
  }
  const [insEmpSalary, setInsEmpSalary] = useState<number>(0);
  const handleInsEmpSal = (e: React.ChangeEvent<HTMLInputElement>) => {
    setInsEmpSalary(parseInt(e.target.value));
  }
  // const [insStartDate, setInsStartDate] = useState<any>();
  // const handleInsStartDate = (e: React.ChangeEvent<HTMLInputElement>) => {
  //   setInsStartDate((e.target.value));
  // }

  const [insTeamId, setInsTeamId] = useState<number>(0);
  const handleInsTeamId = (e: React.ChangeEvent<HTMLInputElement>) => {
    setInsTeamId(parseInt(e.target.value));
  }

  const [insFirstName, setInsFirstName] = useState<string>('');
  const handleInsFirstName = (e: React.ChangeEvent<HTMLInputElement>) => {
    setInsFirstName(String(e.target.value));
  }

  const [insLastName, setInsLastName] = useState<string>('');
  const handleInsLastName = (e: React.ChangeEvent<HTMLInputElement>) => {
    setInsLastName(String(e.target.value));
  }

  const [insUsername, setInsUsername] = useState<string>('');
  const handleInsUsername = (e: React.ChangeEvent<HTMLInputElement>) => {
    setInsUsername(String(e.target.value));
  }

  const [insEmail, setInsEmail] = useState<string>("");
  const handleInsEmail = (e: React.ChangeEvent<HTMLInputElement>) => {
    setInsEmail(e.target.value);
  }

  const [insManagerId, setInsManagerId] = useState<number>(0);
  const handleInsManagerId = (e: React.ChangeEvent<HTMLInputElement>) => {
    setInsManagerId(parseInt(e.target.value))
  }

  const handleInsEmployee = () => {
    axios.post(`http://localhost:4000/employees?position=${insertEmpPos}&salary=${insEmpSalary}&teamId=${insTeamId}&managerId=${insManagerId}`, { firstName: insFirstName, lastName: insLastName, username: insUsername, email: insEmail })
      .then(res => {
        if (res.status === 200) {
          alert(" seccess ")
        }
      })
      .catch(err => { alert('error insert') })
  }

  const [companyNameToputEmp, setCompanyNameToPutEmp] = useState<string>('');
  const handleCompNameToPutEmp = (e: React.ChangeEvent<HTMLInputElement>) => {
    setCompanyNameToPutEmp(e.target.value);
  }
  const [usernameToPutEmp, setUsernameToPutEmp] = useState<string>('');
  const handeleUsername = (e: React.ChangeEvent<HTMLInputElement>) => {
    setUsernameToPutEmp(e.target.value);
  }

  const handleEmpPut=()=>{
    axios.put(`http://localhost:4000/employees?position=${insertEmpPos}&salary=${insEmpSalary}&teamId=${insTeamId}&managerId=${insManagerId}`, { firstName: insFirstName, lastName: insLastName, username: insUsername, email: insEmail,companyName:companyNameToputEmp, oldUsername:usernameToPutEmp })
    .then(res=>{if (res.status===200) {
      alert('success')
    }}).then(err=>{alert('error')})
  }

  return (
    <div className="App">



      <span className='heading'>Filter employees by country and years in the company</span>
      <p>Country</p>
      <input type="text" value={enterCountry} onChange={handleChangeEnterCountry} name='enterCountry' />
      <p>Years in the company</p>
      <input type="text" value={years} onChange={handleChangeYears} name='years' />
      <button onClick={handleFilter}>filter</button>
      {filterEmp.map((emp, index) => {
        return (<span key={index}>This are the employees {emp.workers} from {emp.country} with {years} in the company</span>)
      })}

      <span className='heading'>Get team and manager by team name</span>
      <p>Enter team name</p>
      <input type="text" value={teamName} onChange={handleChangeTeam} name='teamName' />
      <button onClick={handleTeam}>filter</button>
      {getTeam.map((team, index) => {
        return (<span key={index}>This is team {team.team_name}: {team.team_mates} and its manager with id={team.manager_id} </span>)
      })}

      <span className='heading'>Get workers in company with atleast 6 months experiance </span>
      <p>Enter company name</p>
      <input type="text" value={companyName} onChange={handleChangeCompanyName} name='companyName' />
      <button onClick={handleCompany}>Enter</button>
      {getCompany.map((company, index) => {
        return (<span key={index}>{company.emp_count} workers:{company.workers} in {companyName}</span>)
      })}

      <span className='heading'>Search if company exists by name </span>
      <p>Enter company name</p>
      <input type="text" value={searchCompany} onChange={handleChangeSearch} name='searchCompany' />
      <button onClick={handleCompanySearch}>serch</button>
      {getSerachedCompany.map((company, index) => {
        return (<span key={index}> Serch result: id-{company.id}, name-{company.name}, country-{company.country} </span>)
      })}

      <span className='heading'>Add company</span>
      <p>Company name</p>
      <input type="text" value={value} onChange={(e) => handleChangeName(e)} name='value' />
      <p>Country</p>
      <input type="text" value={country} onChange={handleChangeCountry} name='country' />
      <button onClick={handleSave}>save</button>

      <span className='heading'>Update Company </span>
      <p>Enter company name</p>
      <input type="text" value={companyToUpdate} onChange={handleCompanyToUpdate} name='companyToUpdate' />
      <p>New name</p>
      <input type="text" value={companyNameToPut} onChange={handleNameToPut} name='companyNameToPut' />
      <p>New country</p>
      <input type="text" value={countryToPut} onChange={handleCountryToPut} name='countryToPut' />
      <button onClick={handleCompanyPut}>update</button>

      <span className='heading'>Delete Company by name</span>
      <input type="text" value={companyToDelete} onChange={handleCompanyNameToDelete} name='companyToDelete' />
      <button onClick={handleCompanyDetele}>Delete</button>

      <span className='heading'>View all the the employees in given company </span>
      <input type="text" value={getEmpsByCompany} onChange={handleEmpsByCompany} name='getEmpsByCompany' />
      <button onClick={handleEmpsDisplay}>view</button>
      {dissplayEmps.map((emps, index) => {
        return (<span key={index}>{emps.employees}</span>)
      })}

      <span className='heading'>Updete epmloyee (fill the new data below in Add employees then press Update)</span>
      <p>Company name</p>
      <input type="text" value={companyNameToputEmp} onChange={handleCompNameToPutEmp} name='companyNameToputEmp' />
      <p>Username</p>
      <input type="text" value={usernameToPutEmp} onChange={handeleUsername} name='usernameToPutEmp' />
      <button onClick={handleEmpPut}>Update</button>

      <span className='heading'>Add Employeee</span>
      <p>position</p>
      <input type="text" value={insertEmpPos} onChange={handleInsEmpPos} name='insertEmpPos' />
      <p>salary</p>
      <input type="text" value={insEmpSalary} onChange={handleInsEmpSal} name='insEmpSalary' />
      <p>team id</p>
      <input type="text" value={insTeamId} onChange={handleInsTeamId} name='insTeamId' />
      <p>First name</p>
      <input type="text" value={insFirstName} onChange={handleInsFirstName} name='insFirstName' />
      <p>Last name</p>
      <input type="text" value={insLastName} onChange={handleInsLastName} name='insLastName' />
      <p>userneme</p>
      <input type="text" value={insUsername} onChange={handleInsUsername} name='insUsername' />
      <p>E-mail</p>
      <input type="text" value={insEmail} onChange={handleInsEmail} name='insEmail' />
      <p>Manager id</p>
      <input type="text" value={insManagerId} onChange={handleInsManagerId} name='insManagerId' />
      <button onClick={handleInsEmployee}>Add</button>




      <span className='heading'>Delete employee by username </span>
      <input type="text" value={empToDelete} onChange={handleDelEmpName} name='empToDelete' />
      <button onClick={handleEmpDelete}>Delete</button>


      {salaries.map((salary, index) => {
        return (<span key={index}>This is the avarige salary {salary.avg_salary} for department {salary.department} </span>)
      })}


    </div>

  );
}

export default App;
