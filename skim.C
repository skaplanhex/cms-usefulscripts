// Tree skimmer originally written by Dinko Ferencek and altered by Steven Kaplan

#include <iostream>
#include "TTree.h"
#include "TFile.h"
#include "TRFIOFile.h"
#include "TLeaf.h"
#include "TBranch.h"
#include <fstream>
#include <string>
#include <map>
#include <math.h>
#include "TChain.h"

using namespace std;

int skim(const string& infile, const string& outname, Int_t nevts = -1){

  TFile *oldfile = TFile::Open(infile.c_str());
  TTree *oldtree = (TTree*)oldfile->Get("tagVars/ttree");

  if(oldtree)
    cout << "Filtering file: " << infile << endl;
  else {
    cout << "File has no TTree: " << endl;
    return 0;
  }

  TFile *outfile = new TFile(outname.c_str(),"RECREATE","ROOT file with histograms");
  outfile->Close();

  outfile = new TFile(outname.c_str(),"UPDATE","ROOT file with histograms");

  TTree *newtree = oldtree->CloneTree(0);

  Int_t nentries = (Int_t)oldtree->GetEntries();

  float _jetFlavour;

  oldtree->SetBranchAddress("Jet_flavour",&_jetFlavour);

  for (Int_t i=0;i<nentries; i++){
    if (i%100000 == 0) printf ("Inspecting Entry %d\n", i);

    oldtree->GetEntry(i);
    if (abs(_jetFlavour) == 4) newtree->Fill();
  }

  // if(nevts>nentries || nevts<0) nevts = nentries;

  // for (Int_t i=0;i<nevts; i++)
  //   {
  //     if (i%10 == 0) printf ("Entry: %d\n", i);

  //     oldtree->GetEntry(i);
  //     newtree->Fill();
  //   }

  newtree->AutoSave();

  delete outfile;
  delete oldfile;

  return 0;
}
