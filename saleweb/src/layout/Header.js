import { useEffect, useState } from "react";
import { Container, Nav, Navbar, NavDropdown } from "react-bootstrap";
import { Link } from "react-router-dom";
import APIs, { endpoints } from "../configs/APIs";

const Header = () => {
    const [categories, setCategories] = useState([]);

    const loadCates = async () => {
        let res = await APIs.get(endpoints['categories']);
        setCategories(res.data);
    }

    useEffect(() => {
        loadCates();
    }, [])

    return (<>
       
        <Navbar expand="lg" className="bg-body-tertiary">
            <Container>
                <Navbar.Brand href="#home">E-commerce Website</Navbar.Brand>
                <Navbar.Toggle aria-controls="basic-navbar-nav" />
                <Navbar.Collapse id="basic-navbar-nav">
                <Nav className="me-auto">
                   
                    <Link to="/" className="nav-link">Trang chủ</Link>
                
                    <NavDropdown title="Danh mục" id="basic-nav-dropdown">
                        {categories.map(c => {
                            const url = `/?cateId=${c.id}`
                            return <Link className="dropdown-item" key={c.id} to={url}>{c.name}</Link>;
                        })}
                    </NavDropdown>
                </Nav>
                </Navbar.Collapse>
            </Container>
        </Navbar>
    </>);
}

export default Header;