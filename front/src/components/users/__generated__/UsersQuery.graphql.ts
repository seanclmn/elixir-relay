/**
 * @generated SignedSource<<db2dd8765fe4b6cc60fccd2291d09d54>>
 * @lightSyntaxTransform
 * @nogrep
 */

/* tslint:disable */
/* eslint-disable */
// @ts-nocheck

import { ConcreteRequest, Query } from 'relay-runtime';
export type UsersQuery$variables = Record<PropertyKey, never>;
export type UsersQuery$data = {
  readonly allUsers: ReadonlyArray<{
    readonly email: string;
    readonly firstname: string;
    readonly id: string;
    readonly lastname: string;
  }>;
};
export type UsersQuery = {
  response: UsersQuery$data;
  variables: UsersQuery$variables;
};

const node: ConcreteRequest = (function(){
var v0 = [
  {
    "alias": null,
    "args": null,
    "concreteType": "User",
    "kind": "LinkedField",
    "name": "allUsers",
    "plural": true,
    "selections": [
      {
        "alias": null,
        "args": null,
        "kind": "ScalarField",
        "name": "firstname",
        "storageKey": null
      },
      {
        "alias": null,
        "args": null,
        "kind": "ScalarField",
        "name": "lastname",
        "storageKey": null
      },
      {
        "alias": null,
        "args": null,
        "kind": "ScalarField",
        "name": "email",
        "storageKey": null
      },
      {
        "alias": null,
        "args": null,
        "kind": "ScalarField",
        "name": "id",
        "storageKey": null
      }
    ],
    "storageKey": null
  }
];
return {
  "fragment": {
    "argumentDefinitions": [],
    "kind": "Fragment",
    "metadata": null,
    "name": "UsersQuery",
    "selections": (v0/*: any*/),
    "type": "RootQueryType",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": [],
    "kind": "Operation",
    "name": "UsersQuery",
    "selections": (v0/*: any*/)
  },
  "params": {
    "cacheID": "ef17c8e6787d8fd272d48d7f81a3200e",
    "id": null,
    "metadata": {},
    "name": "UsersQuery",
    "operationKind": "query",
    "text": "query UsersQuery {\n  allUsers {\n    firstname\n    lastname\n    email\n    id\n  }\n}\n"
  }
};
})();

(node as any).hash = "917ed9d397d9f425f44455244ef31035";

export default node;
