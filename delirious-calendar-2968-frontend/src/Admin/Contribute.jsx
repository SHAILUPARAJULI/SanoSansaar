import { useToast } from "@chakra-ui/react";
import axios from "axios";
import React, { useState } from "react";

export const Contribute = () => {
  const [catFullName, setCatFullName] = useState("");
  const [catEmail, setCatEmail] = useState("");
  const [catBreed, setCatBreed] = useState("");
  const [catAge, setCatAge] = useState("");
  const [catMessage, setCatMessage] = useState("");
  const [catImage, setCatImage] = useState("");
  const [catColor, setCatColor] = useState("");
  const [catGender, setCatGender] = useState("");
  const [catSize, setCatSize] = useState("");
  const [catDescription, setCatDescription] = useState("");

  const [dogFullName, setDogFullName] = useState("");
  const [dogEmail, setDogEmail] = useState("");
  const [dogBreed, setDogBreed] = useState("");
  const [dogAge, setDogAge] = useState("");
  const [dogMessage, setDogMessage] = useState("");
  const [dogImage, setDogImage] = useState("");
  const [dogColor, setDogColor] = useState("");
  const [dogGender, setDogGender] = useState("");
  const [dogSize, setDogSize] = useState("");
  const [dogDescription, setDogDescription] = useState("");

  const toast = useToast();

  const handleSubmitCat = (e) => {
    e.preventDefault();

    const catObject = {
      cat_name: catFullName,
      age: catAge,
      breed: catBreed,
      color: catColor,
      gender: catGender,
      size: catSize,
      description: catDescription,
      adoption_fee: catMessage,
      location: catEmail,
      image_url: catImage,
    };

    axios
      .post("https://cute-erin-tick-hat.cyclic.cloud/cats/add", catObject)
      .then((res) => {
        toast({
          title: "Cats Data Added",
          status: "success",
          duration: 2000,
          isClosable: true,
        });
        console.log(res.data);
      })
      .catch((err) => {
        toast({
          title: "An Error Occurred",
          status: "error",
          duration: 2000,
          isClosable: true,
        });
        console.log(err);
      });
  };

  const handleSubmitDog = (e) => {
    e.preventDefault();

    const dogObject = {
      name: dogFullName, // Changed from dog_name to name
      age: dogAge,
      breed: dogBreed,
      color: dogColor,
      gender: dogGender,
      size: dogSize,
      description: dogDescription,
      price: dogMessage,
      location: dogEmail,
      image: dogImage,
    };

    axios
      .post("https://cute-erin-tick-hat.cyclic.cloud/dogs/add", dogObject)
      .then((res) => {
        toast({
          title: "Dogs Data Added",
          status: "success",
          duration: 2000,
          isClosable: true,
        });
      })
      .catch((err) => {
        toast({
          title: "An Error Occurred",
          status: "error",
          duration: 2000,
          isClosable: true,
        });
        console.log(err);
      });
  };

  return (
    <div className="contribution-form-container">
      <br />
      <h2 className="header">Contribute to Sano Sansar</h2>
      <div style={{ display: "flex", justifyContent: "space-between" }}>
        <div style={{ width: "48%" }}>
          <h3>Cat Form</h3>
          <form onSubmit={handleSubmitCat}>
            <div className="form-group">
              <label htmlFor="catFullName">Pet Name:</label>
              <input
                type="text"
                id="catFullName"
                value={catFullName}
                onChange={(e) => setCatFullName(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="catEmail">Location:</label>
              <input
                type="text"
                id="catEmail"
                value={catEmail}
                onChange={(e) => setCatEmail(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="catBreed">Pet Breed:</label>
              <input
                type="text"
                id="catBreed"
                value={catBreed}
                onChange={(e) => setCatBreed(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="catAge">Age:</label>
              <input
                type="number"
                id="catAge"
                value={catAge}
                onChange={(e) => setCatAge(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="catColor">Color:</label>
              <input
                type="text"
                id="catColor"
                value={catColor}
                onChange={(e) => setCatColor(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="catGender">Gender:</label>
              <input
                type="text"
                id="catGender"
                value={catGender}
                onChange={(e) => setCatGender(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="catSize">Size:</label>
              <input
                type="text"
                id="catSize"
                value={catSize}
                onChange={(e) => setCatSize(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="catDescription">Description:</label>
              <textarea
                id="catDescription"
                value={catDescription}
                onChange={(e) => setCatDescription(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="catMessage">Adoption Fees:</label>
              <input
                type="text"
                id="catMessage"
                value={catMessage}
                onChange={(e) => setCatMessage(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="catImage">Image Url:</label>
              <input
                type="text"
                id="catImage"
                value={catImage}
                onChange={(e) => setCatImage(e.target.value)}
                required
              />
            </div>
            <button
              style={{ marginTop: "30px" }}
              className="Button"
              type="submit"
            >
              Submit Cat
            </button>
          </form>
        </div>
        <div style={{ width: "48%" }}>
          <h3>Dog Form</h3>
          <form onSubmit={handleSubmitDog}>
            <div className="form-group">
              <label htmlFor="dogFullName">Pet Name:</label>
              <input
                type="text"
                id="dogFullName"
                value={dogFullName}
                onChange={(e) => setDogFullName(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="dogEmail">Location:</label>
              <input
                type="text"
                id="dogEmail"
                value={dogEmail}
                onChange={(e) => setDogEmail(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="dogBreed">Pet Breed:</label>
              <input
                type="text"
                id="dogBreed"
                value={dogBreed}
                onChange={(e) => setDogBreed(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="dogAge">Age:</label>
              <input
                type="number"
                id="dogAge"
                value={dogAge}
                onChange={(e) => setDogAge(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="dogColor">Color:</label>
              <input
                type="text"
                id="dogColor"
                value={dogColor}
                onChange={(e) => setDogColor(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="dogGender">Gender:</label>
              <input
                type="text"
                id="dogGender"
                value={dogGender}
                onChange={(e) => setDogGender(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="dogSize">Size:</label>
              <input
                type="text"
                id="dogSize"
                value={dogSize}
                onChange={(e) => setDogSize(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="dogDescription">Description:</label>
              <textarea
                id="dogDescription"
                value={dogDescription}
                onChange={(e) => setDogDescription(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="dogMessage">Price:</label>
              <input
                type="text"
                id="dogMessage"
                value={dogMessage}
                onChange={(e) => setDogMessage(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="dogImage">Image Url:</label>
              <input
                type="text"
                id="dogImage"
                value={dogImage}
                onChange={(e) => setDogImage(e.target.value)}
                required
              />
            </div>
            <button
              style={{ marginTop: "30px" }}
              className="Button"
              type="submit"
            >
              Submit Dog
            </button>
          </form>
        </div>
      </div>
    </div>
  );
};
export default Contribute;
