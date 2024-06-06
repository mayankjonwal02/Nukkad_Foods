import logo from './logo.svg';
import './App.css';
import SignupAdmin from './screens/SignupAdmin';
import SigninAdmin from './screens/SigninAdmin';
import Process from './screens/Process';
import Option from './screens/Option';

import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import SigninSubAdmin from './screens/SigninSubAdmin';


function App() {
  return (
    <div className="" style={{backgroundColor:"#7fffd4",minHeight:"100vh"}}>
      <Router>
        <Routes>
          <Route path="/signupadmin" element={<SignupAdmin/>} />
          <Route path="/signinadmin" element={<SigninAdmin/>} />
          <Route path="/signinsubadmin" element={<SigninSubAdmin/>} />
          <Route path="/process" element={<Process/>} />
          <Route path="/" element={<Option/>} />
        </Routes>
      </Router>
    </div>
  );
}

export default App;
