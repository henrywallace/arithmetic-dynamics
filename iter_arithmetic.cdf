(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 10.1' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1064,         20]
NotebookDataLength[     16486,        466]
NotebookOptionsPosition[     16052,        427]
NotebookOutlinePosition[     16527,        448]
CellTagsIndexPosition[     16484,        445]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Iterative Arithmetic Functions", "Section"],

Cell[TextData[{
 "For the purposes of this notebook we model functions of the form ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    RowBox[{"\[CurlyPhi]", "(", "x", ")"}], "=", 
    RowBox[{
     RowBox[{"a", " ", 
      SuperscriptBox["x", "p"]}], "+", "b"}]}], TraditionalForm]]],
 " where ",
 Cell[BoxData[
  FormBox[
   RowBox[{"x", "\[Element]", "\[DoubleStruckCapitalZ]"}], 
   TraditionalForm]]],
 ". Although, we could expand the domain by making some easy changes. For \
now, however, let\[CloseCurlyQuote]s just look at this broad class of \
iterative arithmetic functions. To get started, see that we can define a \
function of this form either with an anonymous function:"
}], "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"Mod", "[", 
    RowBox[{
     RowBox[{
      SuperscriptBox["#", "2"], "+", "1"}], ",", "11"}], "]"}], "&"}], "/@", 
  RowBox[{"{", 
   RowBox[{"0", ",", "1", ",", " ", "2", ",", " ", "3", ",", " ", "4"}], 
   "}"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "2", ",", "5", ",", "10", ",", "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[TextData[{
 "Then, we can use the function ",
 StyleBox["NestList", "Input"],
 " to generate a list of the function applied to itself for some amount of \
time given some initial value. There is the function ",
 StyleBox["NestListWhile", "Input"],
 " that could iterate until some condition was met, but I couldn\
\[CloseCurlyQuote]t figure out how to get it too look if it had repeated \
itself. But I think there must be a way to be clever about finding an upper \
bound. But for now we\[CloseCurlyQuote]ll be blunt and choose the number 20. \
Here\[CloseCurlyQuote]s an example:"
}], "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"NestList", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"Mod", "[", 
     RowBox[{
      RowBox[{
       SuperscriptBox["#", "2"], "+", "1"}], ",", "11"}], "]"}], "&"}], ",", 
   "0", ",", "20"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0", ",", "1", ",", "2", ",", "5", ",", "4", ",", "6", ",", "4", ",", "6", 
   ",", "4", ",", "6", ",", "4", ",", "6", ",", "4", ",", "6", ",", "4", ",", 
   "6", ",", "4", ",", "6", ",", "4", ",", "6", ",", "4"}], "}"}]], "Output"]
}, Open  ]],

Cell[TextData[{
 "Now I want to feed bigram transitions into ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 "\[CloseCurlyQuote]s ",
 StyleBox["GraphPlot", "Input"],
 " funciton that needs a list of rules. We can do this using an offset on the \
",
 StyleBox["Partition", "Input"],
 " funciton. I define a the function function ",
 StyleBox["GetRules", "Input"],
 " that takes in a list of numbers and spits out a list of transition rules:"
}], "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"GetRules", "[", "list_", "]"}], ":=", 
  RowBox[{
   RowBox[{
    RowBox[{"Rule", "@@", "#"}], "&"}], "/@", 
   RowBox[{"Partition", "[", 
    RowBox[{"list", ",", "2", ",", "1"}], "]"}]}]}], "\[IndentingNewLine]", 
 RowBox[{"GetRules", "[", 
  RowBox[{"NestList", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"Mod", "[", 
      RowBox[{
       RowBox[{
        SuperscriptBox["#", "2"], "+", "1"}], ",", "11"}], "]"}], "&"}], ",", 
    "0", ",", "20"}], "]"}], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"0", "\[Rule]", "1"}], ",", 
   RowBox[{"1", "\[Rule]", "2"}], ",", 
   RowBox[{"2", "\[Rule]", "5"}], ",", 
   RowBox[{"5", "\[Rule]", "4"}], ",", 
   RowBox[{"4", "\[Rule]", "6"}], ",", 
   RowBox[{"6", "\[Rule]", "4"}], ",", 
   RowBox[{"4", "\[Rule]", "6"}], ",", 
   RowBox[{"6", "\[Rule]", "4"}], ",", 
   RowBox[{"4", "\[Rule]", "6"}], ",", 
   RowBox[{"6", "\[Rule]", "4"}], ",", 
   RowBox[{"4", "\[Rule]", "6"}], ",", 
   RowBox[{"6", "\[Rule]", "4"}], ",", 
   RowBox[{"4", "\[Rule]", "6"}], ",", 
   RowBox[{"6", "\[Rule]", "4"}], ",", 
   RowBox[{"4", "\[Rule]", "6"}], ",", 
   RowBox[{"6", "\[Rule]", "4"}], ",", 
   RowBox[{"4", "\[Rule]", "6"}], ",", 
   RowBox[{"6", "\[Rule]", "4"}], ",", 
   RowBox[{"4", "\[Rule]", "6"}], ",", 
   RowBox[{"6", "\[Rule]", "4"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[TextData[{
 "We also want to iterate over all reduced residues for a modulus ",
 Cell[BoxData[
  FormBox["q", TraditionalForm]]],
 ", i.e. get the rules for all of starting points in ",
 StyleBox["Range[0, q - 1]", "Input"],
 ". Then we flatten the result to get a big list of rules. But, unfortunately \
this will have a lot of duplicates as rules does already! We can get rid of \
these with the ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " function ",
 StyleBox["DeleteDuplicates", "Input"],
 ":"
}], "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"rules", "=", 
  RowBox[{"DeleteDuplicates", "@", 
   RowBox[{"Flatten", "[", 
    RowBox[{"Map", "[", 
     RowBox[{"GetRules", ",", 
      RowBox[{
       RowBox[{
        RowBox[{"NestList", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"Mod", "[", 
            RowBox[{
             RowBox[{
              SuperscriptBox["#", "2"], "+", "1"}], ",", "11"}], "]"}], "&"}],
           ",", "#", ",", "100"}], "]"}], "&"}], "/@", 
       RowBox[{"Range", "[", 
        RowBox[{"0", ",", 
         RowBox[{"11", "-", "1"}]}], "]"}]}]}], "]"}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"0", "\[Rule]", "1"}], ",", 
   RowBox[{"1", "\[Rule]", "2"}], ",", 
   RowBox[{"2", "\[Rule]", "5"}], ",", 
   RowBox[{"5", "\[Rule]", "4"}], ",", 
   RowBox[{"4", "\[Rule]", "6"}], ",", 
   RowBox[{"6", "\[Rule]", "4"}], ",", 
   RowBox[{"3", "\[Rule]", "10"}], ",", 
   RowBox[{"10", "\[Rule]", "2"}], ",", 
   RowBox[{"7", "\[Rule]", "6"}], ",", 
   RowBox[{"8", "\[Rule]", "10"}], ",", 
   RowBox[{"9", "\[Rule]", "5"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"GraphPlot", "[", 
  RowBox[{"rules", ",", 
   RowBox[{"VertexLabeling", "\[Rule]", "True"}], ",", 
   RowBox[{"DirectedEdges", "\[Rule]", "True"}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[
  TagBox[GraphicsComplexBox[CompressedData["
1:eJw9UH0s1HEc/nL0+53fuaWW15ZTVJzKqisd5/vRi3QjHYuQlZezKVLnZRg1
E0feai4vYW0Yt5bdDt1IU43TduOSMi1CrLKUFGVufr9L1nq2Z8+ePXuePx6n
mORgqSlCiL/Gv9rAPZXuxJ/FBcdd3gx2bQT/I+Jyj4hFbJAfVDqncKD/7NXi
ad5vfJGbqNhWhOCeXufQ+QPBSD6pPCQzBZn32A9meAO8BOl6Ln4w9+JEBwcq
lvNMLIHG6B+eexVmTw7+whqdcH2/UdQXdGd6AW/iMKf7xVYgTxK9G09awVxB
CtKZMv971LUZc1JhBuXB9spWGQErWAp1WQRkCMbDcnMQePgctkluIeDyVOTh
ukwEOOg+y/YNAU8Fxft3piJgVYrMixAJZlKNkZeEgG0t3NPhTsKz0qDhsjgE
4UsNDcXnSFDY+UTIIhA8ftfbbHKThHQrold/GsEYL62GVJFQrda3tfgi0AVs
+e7MpsDAz/1OrjK4qtQkRHWAAv8p8dYnEwzuk0y9UkVRkL3wRZvZw2Cv7Caw
k1Owqs1iB9QyWLO7vnFCRYGdQjovSmOwWC3fvzhKgb3bYkxkAIN3KO6cFxsp
uBJ3y1PNY/DrZf+BURcOHE146Bj4k8ba5uhMJWfNcyuzTobRuExZ3jAySUFk
Z2W31QUa36japXFvp0Bj6amlE2jcfaaoo7uAgt2qD25kBo0fDZWU3I6goC1K
le9eRGPpzx02XXspYPsNp0nraWzGYW0+xqLALxSaHnbQeEYr4Xm/tQBkre4z
6Gm8VKPWOV4nQRg4KPQNNeJd4dr4uyEkfK1mcctSjNig+PRZ4UpCZ2Fs3FCF
Eedd2p7JX/tf2P6ax2iMmOxxtY4fJcDh46wX570RpwqwXKIioLSlNXbZFEFt
sCDKICcg1mI6Y8AWwdx8zrfEaAIMhCSf2YfgD0gaJYE=
    "], {
     {RGBColor[0.5, 0., 0.], Arrowheads[{{0.024665186130574147`, 0.7}}], 
      ArrowBox[{1, 2}], ArrowBox[{2, 3}], ArrowBox[{3, 4}], ArrowBox[{4, 5}], 
      ArrowBox[{5, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
        27, 6}], 
      ArrowBox[{6, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42,
        43, 5}], ArrowBox[{7, 8}], ArrowBox[{8, 3}], ArrowBox[{9, 6}], 
      ArrowBox[{10, 8}], ArrowBox[{11, 4}]}, {InsetBox[
       FrameBox["0",
        Background->RGBColor[1, 1, 0.8],
        FrameStyle->RGBColor[0.94, 0.85, 0.36],
        StripOnInput->False], 1], InsetBox[
       FrameBox["1",
        Background->RGBColor[1, 1, 0.8],
        FrameStyle->RGBColor[0.94, 0.85, 0.36],
        StripOnInput->False], 2], InsetBox[
       FrameBox["2",
        Background->RGBColor[1, 1, 0.8],
        FrameStyle->RGBColor[0.94, 0.85, 0.36],
        StripOnInput->False], 3], InsetBox[
       FrameBox["5",
        Background->RGBColor[1, 1, 0.8],
        FrameStyle->RGBColor[0.94, 0.85, 0.36],
        StripOnInput->False], 4], InsetBox[
       FrameBox["4",
        Background->RGBColor[1, 1, 0.8],
        FrameStyle->RGBColor[0.94, 0.85, 0.36],
        StripOnInput->False], 5], InsetBox[
       FrameBox["6",
        Background->RGBColor[1, 1, 0.8],
        FrameStyle->RGBColor[0.94, 0.85, 0.36],
        StripOnInput->False], 6], InsetBox[
       FrameBox["3",
        Background->RGBColor[1, 1, 0.8],
        FrameStyle->RGBColor[0.94, 0.85, 0.36],
        StripOnInput->False], 7], InsetBox[
       FrameBox["10",
        Background->RGBColor[1, 1, 0.8],
        FrameStyle->RGBColor[0.94, 0.85, 0.36],
        StripOnInput->False], 8], InsetBox[
       FrameBox["7",
        Background->RGBColor[1, 1, 0.8],
        FrameStyle->RGBColor[0.94, 0.85, 0.36],
        StripOnInput->False], 9], InsetBox[
       FrameBox["8",
        Background->RGBColor[1, 1, 0.8],
        FrameStyle->RGBColor[0.94, 0.85, 0.36],
        StripOnInput->False], 10], InsetBox[
       FrameBox["9",
        Background->RGBColor[1, 1, 0.8],
        FrameStyle->RGBColor[0.94, 0.85, 0.36],
        StripOnInput->False], 11]}}],
   Annotation[#, 
    VertexCoordinateRules -> {{0.7552649793874091, 4.18144923665489}, {
     1.209518966413798, 3.5562222615271795`}, {1.3830285498455495`, 
     2.0669528575397607`}, {2.1180269404665752`, 2.3057683112717577`}, {
     2.853025331023269, 2.0669528573417675`}, {3.5880237215799626`, 
     1.8281374034117774`}, {0., 1.3627619614160127`}, {1.209518966189234, 
     1.0553143611794915`}, {4.323022112136657, 1.5893219494817872`}, {
     1.8756809251384001`, 0.}, {2.5722809276613865`, 2.9309952862771023`}}]& ],
  AspectRatio->Automatic,
  FrameTicks->None,
  PlotRange->All,
  PlotRangePadding->Scaled[0.1]]], "Output"]
}, Open  ]],

Cell["For convenience, we create a function to do this for us:", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"GetPlot", "[", 
   RowBox[{"f_", ",", "domain_", ",", "maxiter_"}], "]"}], ":=", 
  RowBox[{"GraphPlot", "[", 
   RowBox[{
    RowBox[{"DeleteDuplicates", "@", 
     RowBox[{"Flatten", "[", 
      RowBox[{"Map", "[", 
       RowBox[{"GetRules", ",", 
        RowBox[{
         RowBox[{
          RowBox[{"NestList", "[", 
           RowBox[{"f", ",", "#", ",", "maxiter"}], "]"}], "&"}], "/@", 
         "domain"}]}], "]"}], "]"}]}], ",", 
    RowBox[{"VertexLabeling", "\[Rule]", "True"}]}], "]"}]}]], "Input"],

Cell["And now let\[CloseCurlyQuote]s create a dynamic window for this \
funciton:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", 
  RowBox[{
   RowBox[{"GetPlot", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"Mod", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"a", 
          SuperscriptBox["#", "p"]}], "+", "b"}], ",", "q"}], "]"}], "&"}], 
     ",", 
     RowBox[{"Range", "[", 
      RowBox[{"0", ",", 
       RowBox[{"q", "-", "1"}]}], "]"}], ",", "maxiter"}], "]"}], ",", 
   RowBox[{"{", 
    RowBox[{"a", ",", "1", ",", "10", ",", "1", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"b", ",", "1", ",", "10", ",", "1", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"p", ",", "1", ",", "10", ",", "1", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"q", ",", "2", ",", "15", ",", "1", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"maxiter", ",", 
     SuperscriptBox["10", "2"], ",", 
     SuperscriptBox["10", "4"], ",", "1", ",", 
     RowBox[{"Appearance", "\[Rule]", "\"\<Labeled\>\""}]}], "}"}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`a$$ = 1, $CellContext`b$$ = 
    1, $CellContext`maxiter$$ = 100, $CellContext`p$$ = 1, $CellContext`q$$ = 
    2, Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{
      Hold[$CellContext`a$$], 1, 10, 1}, {
      Hold[$CellContext`b$$], 1, 10, 1}, {
      Hold[$CellContext`p$$], 1, 10, 1}, {
      Hold[$CellContext`q$$], 2, 15, 1}, {
      Hold[$CellContext`maxiter$$], 100, 10000, 1}}, Typeset`size$$ = {
    360., {16., 21.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = True, $CellContext`a$32029$$ = 
    0, $CellContext`b$32030$$ = 0, $CellContext`p$32031$$ = 
    0, $CellContext`q$32032$$ = 0, $CellContext`maxiter$32033$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`a$$ = 1, $CellContext`b$$ = 
        1, $CellContext`maxiter$$ = 100, $CellContext`p$$ = 
        1, $CellContext`q$$ = 2}, "ControllerVariables" :> {
        Hold[$CellContext`a$$, $CellContext`a$32029$$, 0], 
        Hold[$CellContext`b$$, $CellContext`b$32030$$, 0], 
        Hold[$CellContext`p$$, $CellContext`p$32031$$, 0], 
        Hold[$CellContext`q$$, $CellContext`q$32032$$, 0], 
        Hold[$CellContext`maxiter$$, $CellContext`maxiter$32033$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, 
      "Body" :> $CellContext`GetPlot[
       Mod[$CellContext`a$$ #^$CellContext`p$$ + $CellContext`b$$, \
$CellContext`q$$]& , 
        Range[0, $CellContext`q$$ - 1], $CellContext`maxiter$$], 
      "Specifications" :> {{$CellContext`a$$, 1, 10, 1, Appearance -> 
         "Labeled"}, {$CellContext`b$$, 1, 10, 1, Appearance -> 
         "Labeled"}, {$CellContext`p$$, 1, 10, 1, Appearance -> 
         "Labeled"}, {$CellContext`q$$, 2, 15, 1, Appearance -> 
         "Labeled"}, {$CellContext`maxiter$$, 100, 10000, 1, Appearance -> 
         "Labeled"}}, "Options" :> {}, "DefaultOptions" :> {}],
     ImageSizeCache->{405., {116., 121.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    SynchronousInitialization->True,
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output"]
}, Open  ]]
}, Open  ]]
},
WindowToolbars->"EditBar",
WindowSize->{1038, 807},
Visible->True,
ScrollingOptions->{"VerticalScrollRange"->Fit},
ShowCellBracket->Automatic,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"10.1 for Mac OS X x86 (32-bit, 64-bit Kernel) (March 23, \
2015)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1486, 35, 49, 0, 64, "Section"],
Cell[1538, 37, 692, 18, 70, "Text"],
Cell[CellGroupData[{
Cell[2255, 59, 275, 9, 35, "Input"],
Cell[2533, 70, 104, 2, 28, "Output"]
}, Open  ]],
Cell[2652, 75, 599, 11, 70, "Text"],
Cell[CellGroupData[{
Cell[3276, 90, 233, 8, 35, "Input"],
Cell[3512, 100, 274, 5, 28, "Output"]
}, Open  ]],
Cell[3801, 108, 457, 12, 51, "Text"],
Cell[CellGroupData[{
Cell[4283, 124, 514, 16, 52, "Input"],
Cell[4800, 142, 853, 22, 46, "Output"]
}, Open  ]],
Cell[5668, 167, 526, 14, 71, "Text"],
Cell[CellGroupData[{
Cell[6219, 185, 602, 18, 35, "Input"],
Cell[6824, 205, 496, 13, 28, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7357, 223, 190, 4, 28, "Input"],
Cell[7550, 229, 3827, 82, 363, "Output"]
}, Open  ]],
Cell[11392, 314, 72, 0, 30, "Text"],
Cell[11467, 316, 546, 15, 46, "Input"],
Cell[12016, 333, 91, 1, 30, "Text"],
Cell[CellGroupData[{
Cell[12132, 338, 1206, 32, 74, "Input"],
Cell[13341, 372, 2683, 51, 254, "Output"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Yv0JM0JNa9jrmB1xsQzIk9Ho *)
