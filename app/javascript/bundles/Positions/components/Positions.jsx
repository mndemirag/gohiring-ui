import React, { useState } from "react";
import PropTypes from "prop-types";
import TableRow from "./TableRow";
import "../../../../assets/stylesheets/positions.css";

const Positions = (props) => {
  const [openPositions, setOpenPositions] = useState(props.open_positions);

  const onSave = ({ companyName, title, index }) => {
    openPositions[index] = {
      ...openPositions[index],
      company_name: companyName,
      title: title,
    };
    setOpenPositions([...openPositions]);
  };

  return (
    <>
      <div className="container">
        <table className="table">
          <thead className="tableHeader">
            <tr className="tableRow">
              <th className="tableCell left">Company Name</th>
              <th className="tableCell left">Title</th>
              <th className="tableCell left">Creation Date</th>
              <th className="tableCell right">Action</th>
            </tr>
          </thead>
          <tbody>
            {openPositions.map((position, index) => (
              <TableRow position={position} onSave={onSave} index={index} />
            ))}
          </tbody>
        </table>
      </div>
    </>
  );
};

Positions.propTypes = {
  open_positions: PropTypes.array.isRequired,
};

export default Positions;
