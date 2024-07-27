
import { useEffect, useState } from "react";
import { Button, Card, Col, Row, Spinner } from "react-bootstrap";
import { Link, useSearchParams } from "react-router-dom";
import APIs, { endpoints } from "../configs/APIs";

const Home = () => {
    const [products, setProducts] = useState(null);
    const [q] = useSearchParams();

    const loadProducts = async () => {
        let url = endpoints['products'];

        let cateId = q.get("cateId");
        if (cateId !== null)
            url = `${url}?cateId=${cateId}`

        let res = await APIs.get(url);
        setProducts(res.data);
    }

    useEffect(() => {
        loadProducts();
    }, [q]);


    if (products === null)
        return  <Spinner animation="grow" variant="primary" />;

    return (<>
        <h1>DANH MỤC SẢN PHẨM</h1>

        <Row>
            {products.map(p => <Col className="p-1" key={p.id} md={3} xs={12}>
                <Card>
                    <Card.Img variant="top" src={p.image} />
                    <Card.Body>
                        <Card.Title>{p.name}</Card.Title>
                        <Card.Text>{p.price} VNĐ</Card.Text>
                        <Button variant="danger">Đặt hàng</Button>
                        <Link className="btn btn-info" to="/">Xem chi tiết</Link>
                    </Card.Body>
                </Card>
            </Col>)}
            
        </Row>
    </>);
}

export default Home;