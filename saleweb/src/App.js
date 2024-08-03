import { BrowserRouter, Route, Routes } from "react-router-dom";
import Home from "./components/Home";
import Header from "./layout/Header";
import 'bootstrap/dist/css/bootstrap.min.css';
import { Container } from "react-bootstrap";
import Footer from "./layout/Footer";
import Login from "./components/Login";
import { createContext, useReducer } from "react";
import MyUserReducer from "./reducers/MyUserReducer";
import Register from "./components/Register";
import Cart from "./components/Cart";
import MyCartReducer from "./reducers/MyCartReducer";
import cookie from "react-cookies";

export const MyUserContext = createContext();
export const MyDispatchContext = createContext();
export const MyCartContext = createContext();

const count = () => {
  let cart = cookie.load("cart") || null;
  if (cart !== null) {
      let totalQuantity = 0;
      for (let c of Object.values(cart))
          totalQuantity += c.quantity;

      return totalQuantity;
  }
  return 0;
}

const App = () => {
  const [user, dispatch] = useReducer(MyUserReducer, cookie.load("user") || null);
  const [cartCounter, cartDispatch] = useReducer(MyCartReducer, count());

  return (
    <BrowserRouter>
     <MyUserContext.Provider value={user}>
       <MyDispatchContext.Provider value={dispatch}>
         <MyCartContext.Provider value={[cartCounter, cartDispatch]}>
          <Header />
          <Container>
            <Routes>
              <Route path="/" element={<Home />} />
              <Route path="/login" element={<Login />} />
              <Route path="/register" element={<Register />} />
              <Route path="/cart" element={<Cart />} />
            </Routes>
          </Container>
          <Footer />
        </MyCartContext.Provider>
       </MyDispatchContext.Provider>
     </MyUserContext.Provider>
    </BrowserRouter>
  );
}

export default App;