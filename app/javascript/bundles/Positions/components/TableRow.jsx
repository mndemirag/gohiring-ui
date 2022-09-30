import React, { useState } from "react";
import "../../../../assets/stylesheets/positions.css";

const TableRow = (props) => {
  const { position, onSave, index } = props;

  const [inEditMode, setInEditMode] = useState(false);

  const [companyName, setCompanyName] = useState(position.company_name);
  const [title, setTitle] = useState(position.title);

  const onEdit = () => {
    setInEditMode(true);
  };

  const onCancel = () => {
    setCompanyName(position.company_name);
    setTitle(position.title);
    setInEditMode(false);
  };

  const parseISODateString = (date) => {
    var b = date.split(/\D+/);
    return new Date(Date.UTC(b[0], --b[1], b[2], b[3], b[4], b[5], b[6]));
  };

  const isoToDate = (date) => {
    function pad(n) {
      return (n < 10 ? "0" : "") + n;
    }
    return (
      pad(date.getUTCDate()) +
      "/" +
      pad(date.getUTCMonth() + 1) +
      "/" +
      date.getUTCFullYear()
    );
  };

  const getDate = (date) => {
    return isoToDate(parseISODateString(date));
  };

  return (
    <tr key={position.id} className="tableRow">
      <td className="tableCompanyName tableCell left">
        {inEditMode ? (
          <input
            value={companyName}
            onChange={(event) => setCompanyName(event.target.value)}
          />
        ) : (
          position.company_name
        )}
      </td>
      <td className="tableTitle tableCell left">
        {inEditMode ? (
          <input
            value={title}
            onChange={(event) => setTitle(event.target.value)}
          />
        ) : (
          position.title
        )}
      </td>
      <td className="tableDate tableCell left">
        {getDate(position.created_at)}
      </td>
      <td className="tableAction tableCell center">
        {inEditMode ? (
          <>
            <a
              className="button"
              onClick={() => {
                setInEditMode(false);
                onSave({ companyName, title, index });
              }}
            >
              Save
            </a>

            <a
              className="button"
              style={{ marginLeft: 8 }}
              onClick={() => onCancel()}
            >
              Cancel
            </a>
          </>
        ) : (
          <a className="button" onClick={() => onEdit()}>
            Edit
          </a>
        )}
      </td>
    </tr>
  );
};

export default TableRow;
