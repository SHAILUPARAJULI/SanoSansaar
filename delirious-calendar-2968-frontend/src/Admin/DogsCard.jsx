import { useNavigate } from "react-router-dom";
import { Button } from "@chakra-ui/react";
import { FaTrash } from "react-icons/fa"
import { CiEdit } from "react-icons/ci";




export const DogsCard = ({ _id, name, breed, age, location, price, DeleteDogsData }) => {
  const navigate = useNavigate();

  // editdogsdata() function to navigate to edit page
  const EditDogsData = async (id) => {
    // navigate to editpage
    await navigate(`/edit/dogs/${id}`);
  }

  return (
    <div>

      <div key={_id} style={{ marginTop: "10px", padding: "20px", boxShadow: "rgba(0, 0, 0, 0.24) 0px 3px 8px" }}>
        <p style={{ fontWeight: "bold", fontSize: "20px" }}> <span style={{ fontWeight: "bold" }}>Name :- </span> {name}</p>
        <p> <span style={{ fontWeight: "bold" }}>Breed :- </span> {breed}</p>
        <p> <span style={{ fontWeight: "bold" }}>Age :- </span> {age}</p>
        <p> <span style={{ fontWeight: "bold" }}>Location :- </span> {location}</p>
        <p> <span style={{ fontWeight: "bold" }}>Price :- </span> {price}</p>
        <Button mt="15px" colorScheme="red" onClick={() => DeleteDogsData(_id)}> <FaTrash /> </Button>
        <Button mt="15px" colorScheme="blue" onClick={() => EditDogsData(_id)}> <CiEdit /> </Button>
      </div>



    </div>
  );
};

