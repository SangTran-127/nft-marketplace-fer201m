import React from 'react'
import { Routes, Route } from 'react-router-dom'

//hoc element

import AuthRoute from './hoc/AuthRoute'

//routes element
import HomePage from './pages/HomePage'
import Login from './pages/Login'
interface AppRoutesProps { }

const AppRoutes = (props: AppRoutesProps) => {
    return (
        <Routes>
            <Route path='/' element={<AuthRoute><HomePage /></AuthRoute>} />
            <Route path='/login' element={<Login />} />
        </Routes>
    )
}

export default AppRoutes