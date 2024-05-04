const express = require('express');
const OthersModel = require('../Model/OtherModel');

const OtherRoute = express.Router()


OtherRoute.get("/get", async (req, res) => {
  try {
    const { q, name, age, breed, sortBy, sortOrder, page, limit } = req.query;

    // Create an empty filter object
    const filter = {};

    // Apply search filters if provided
    if (q) {
      filter.$or = [
        { name: { $regex: q, $options: "i" } },
        { breed: { $regex: q, $options: "i" } },
      ];
    }

    // Apply additional filters if provided
    if (name) {
      filter.name = { $regex: name, $options: "i" };
    }
    if (age) {
      filter.age = age;
    }
    if (breed) {
      filter.breed = { $regex: breed, $options: "i" };
    }

    // Create the sort object based on sortBy and sortOrder parameters
    let sort = {};
    if (sortBy && sortOrder) {
      sort = { [sortBy]: sortOrder === "asc" ? 1 : -1 };
    }

    // Calculate skip and limit for pagination
    const pageNumber = parseInt(page) || 1;
    const pageSize = parseInt(limit) || 10;
    const skip = (pageNumber - 1) * pageSize;

    // Fetch Other data with applied filters, sort, and pagination
    const OtherData = await OthersModel.find(filter)
      .sort(sort)
      .skip(skip)
      .limit(pageSize);

    // Calculate total count of Other matching the filters
    const totalOthersCount = await OthersModel.countDocuments(filter);

    res.json({ Other: OtherData, totalCount: totalOthersCount });
  } catch (error) {
    res.status(500).json({ error: "Internal Server Error" });
  }
});


OtherRoute.get("/get/:id", async (req, res) => {

  try {

    const { id } = req.params

    const dog = await OthersModel.findById(id)

    res.json({ dog: dog })

  } catch (error) {
    res.status(500).json({ error: "Internal Server Error" });
  }

})


// admin side
OtherRoute.post("/add", async (req, res) => {

  try {

    const updatedOthers = OthersModel(req.body)

    await updatedOthers.save()

    res.json({ updatedOthers: updatedOthers })

  } catch (error) {
    res.status(500).json({ error: "Internal Server Error" })
  }

})

// admin side
OtherRoute.patch("/patch/:id", async (req, res) => {

  try {

    const { id } = req.params

    const upatedOthersData = await OthersModel.findByIdAndUpdate(id, req.body)

    res.json({ message: "Updated Others", data: upatedOthersData })

  } catch (error) {
    res.status(500).json({ error: "Internal Server Error" })
  }

})

// admin side
OtherRoute.delete("/delete/:id", async (req, res) => {

  try {

    const { id } = req.params

    const upatedOthersData = await OthersModel.findByIdAndDelete(id)

    res.json({ message: "Deleted Others", data: upatedOthersData })

  } catch (error) {
    res.status(500).json({ error: "Internal Server Error" })
  }

})




module.exports = OtherRoute