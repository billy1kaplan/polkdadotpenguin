import React from "react";
import { useQuery, gql } from '@apollo/client';

import "./app.css";

const ALL_FRIENDS = gql`
  query GetAllFriends {
    friends {
        id
        name
        email
    }
}
`;

export default function App() {
    const { loading, error, data } = useQuery(ALL_FRIENDS);

    if (loading) return <p>Loading...</p>;
    if (error) return <p>Error: {error}</p>;

    return (
        <>
            <h1 className="blue">polkdadotpenguin</h1>
            <p>You may also wish to use <a href="/graphiql.html">graphiql</a> to debug your GraphQL.</p>
            <p>my friends, loaded with GraphQL:</p>
            <ul>
                {data.friends.map(({ id, name, email }) => (
                    <li key={id}>
                        {name}: {email}
                    </li>
                ))}
            </ul>
        </>
    );
}
