import React from 'react';
import { EditContribution } from '../../Admin/Edit';

const EditPage = ({ pet_type, pet_id }) => {
    // Assuming you have petType and petId from your application state or props
    const petType = pet_type; // or 'dogs'
    const petId = pet_id; // ID of the pet to be edited

    return (
        <div>
            <h1>Edit Page</h1>
            <EditContribution petType={petType} petId={petId} />
        </div>
    );
};

export default EditPage;
