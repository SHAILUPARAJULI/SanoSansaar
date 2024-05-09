import { useToast } from "@chakra-ui/react";
import axios from "axios";
import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";

import { useNavigate } from "react-router-dom";

export const EditContribution = () => {
  const [petData, setPetData] = useState({});
  const toast = useToast();
  const { petType, petId } = useParams();
  const navigate = useNavigate();

  useEffect(() => {
    const fetchPetData = async () => {
      try {
        // Fetch existing pet data from the API using petType (e.g., 'cats' or 'dogs') and petId
        const response = await axios.get(
          `https://cute-erin-tick-hat.cyclic.cloud/${petType}/get/${petId}`,
          { headers: { "Cache-Control": "no-cache" } }
        );
        setPetData(response.data);
      } catch (error) {
        // Handle errors
        toast({
          title: "An Error Occurred",
          status: "error",
          duration: 2000,
          isClosable: true,
        });
        console.error(error);
      }
    };

    fetchPetData(); // Call the async function to fetch pet data
  }, [petType, petId, toast]);

  const handleUpdate = async () => {
    try {
      // Send updated pet data to the API
      const response = await axios.patch(
        `https://cute-erin-tick-hat.cyclic.cloud/${petType}/patch/${petId}`,
        petData
      );
      toast({
        title: "Pet Data Updated",
        status: "success",
        duration: 2000,
        isClosable: true,
      });
      console.log(response.data);
    } catch (error) {
      // Handle errors
      toast({
        title: "An Error Occurred",
        status: "error",
        duration: 2000,
        isClosable: true,
      });
      console.error(error);
    }
    // Redirect to the pet's page
    navigate(`/adminHome`);
  };

  const handleChange = (e) => {
    // Update petData state when input fields change
    setPetData({ ...petData, [e.target.name]: e.target.value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    handleUpdate(); // Call handleUpdate when form is submitted
  };

  return (
    <div className="edit-contribution-form-container">
      <br />
      <h2 className="header">Edit {petType === "cats" ? "Cat" : "Dog"}</h2>
      <form onSubmit={handleSubmit}>
        {/* Input fields for pet data */}
        <div className="form-group">
          <label htmlFor="fullName">Pet Name:</label>
          <input
            type="text"
            id="fullName"
            name={petType === "cats" ? "cat_name" : "name"}
            value={petData.name}
            onChange={handleChange}
          />
        </div>
        {/* Add other input fields for age, breed, color, gender, size, description, message, and image */}

        {/* Input fields for pet data */}
        <div className="form-group">
          <label htmlFor="age">Age:</label>
          <input
            type="number"
            id="age"
            name="age"
            value={petData.age}
            onChange={handleChange}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="breed">Breed:</label>
          <input
            type="text"
            id="breed"
            name="breed"
            value={petData.breed}
            onChange={handleChange}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="color">Color:</label>
          <input
            type="text"
            id="color"
            name="color"
            value={petData.color}
            onChange={handleChange}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="gender">Gender:</label>
          <input
            type="text"
            id="gender"
            name="gender"
            value={petData.gender}
            onChange={handleChange}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="size">Size:</label>
          <input
            type="text"
            id="size"
            name="size"
            value={petData.size}
            onChange={handleChange}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="description">Description:</label>
          <textarea
            id="description"
            name="description"
            value={petData.description}
            onChange={handleChange}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="message">Message:</label>
          <input
            type="text"
            id="message"
            name="message"
            value={petData.message}
            onChange={handleChange}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="image">Image URL:</label>
          <input
            type="text"
            id="image"
            name="image"
            value={petData.image}
            onChange={handleChange}
            required
          />
        </div>

        <button style={{ marginTop: "30px" }} className="Button" type="submit">
          Update {petType === "cats" ? "Cat" : "Dog"}
        </button>
      </form>
    </div>
  );
};
export default EditContribution;
