"use client";

import Link from "next/link";
import type { NextPage } from "next";
import { useAccount } from "wagmi";
import { BugAntIcon, MagnifyingGlassIcon } from "@heroicons/react/24/outline";
import { Address } from "~~/components/scaffold-eth";
import fs from 'fs';
import path from 'path';

const buildInfoDirectory = path.resolve(__dirname, 'path/to/directory');

try {
  if (!fs.existsSync(buildInfoDirectory)) {
    throw new Error(`Directory ${buildInfoDirectory} not found.`);
  }
  // Proceed with your logic if the directory exists
} catch (error) {
  console.error(error.message);
  // Handle the error appropriately, e.g., create the directory or exit the process
}

const artists = [
  {
    name: "Artist One",
    image: "/images/artist1.png",
    profileLink: "/artists/artist-one",
  },
  {
    name: "Artist Two",
    image: "/images/artist2.png",
    profileLink: "/artists/artist-two",
  },
  {
    name: "Artist Three",
    image: "/images/artist3.png",
    profileLink: "/artists/artist-three",
  },
  // Add more artists as needed
];


const Home: NextPage = () => {
  const { address: connectedAddress } = useAccount();

  return (
    <>
      <div className="flex flex-col items-center flex-grow pt-10 bg-gradient-to-r from-purple-400 via-pink-500 to-red-500 min-h-screen">
        <div className="px-5">
          <h1 className="text-center text-5xl font-extrabold text-white mb-5">Support Local Artists</h1>
          <p className="text-center text-xl text-white mb-10">
            Discover and support local artists through various Web3 DeFi ways like NFTs, staking, and more.
          </p>
          <div className="flex justify-center items-center space-x-2 flex-col sm:flex-row mb-10">
            <p className="my-2 font-medium text-white">Connected Address:</p>
            <Address address={connectedAddress} />
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
            {artists.map((artist, index) => (
              <div key={index} className="flex flex-col bg-white px-10 py-10 text-center items-center max-w-xs rounded-3xl shadow-lg transform transition duration-500 hover:scale-105">
                <img src={artist.image} alt={artist.name} className="h-24 w-24 mb-4 rounded-full border-4 border-purple-500" />
                <p className="mb-2 font-bold text-lg text-gray-800">{artist.name}</p>
                <Link href={artist.profileLink} legacyBehavior>
                  <a className="btn btn-primary bg-gradient-to-r from-purple-500 to-pink-500 text-white font-bold py-2 px-4 rounded-full">View Profile</a>
                </Link>
              </div>
            ))}
          </div>
        </div>
      </div>
    </>
  );
};

export default Home;
