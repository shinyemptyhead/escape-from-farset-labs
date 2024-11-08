"Escape From Farset Labs" by Ciaran Conliffe

Release along with a website, the introductory booklet, an introductory postcard, the source text, and an interpreter.

Include Basic Screen Effects by Emily Short.

SECTION 1 - Story setup

The story headline is "A thrilling tale of derring-do and 3D printers.". 

The story description is "Escape From Farset Labs is a light-hearted short interactive fiction game created as an example for the Northern Ireland Developers Conference 2024. If you've never played a game like this before, the idea is that you type in commands to carry out actions. The aim is to figure out how to repair your bike so you can leave the labs and go home.

If you want to play the game, click 'Play In Browser' in the sidebar.

If you want to learn more about this game, or the resources I used to make it, click 'About This Game' in the sidebar.

You can also view the source code by clicking 'Source Text', though of course this will spoil the game for you.

If you're completely new to text adventures, check out the Interactive Fiction Overview in the sidebar, or the IF Basics for a one-page guide. There is also some basic help available within the game itself."

The story creation year is 2024. Use scoring. The maximum score is 20.

When play begins:
	say "[paragraph break]It's been another productive day at Farset Labs, a perfect little hackerspace tucked away in the corner of Belfast. But you're done for the day and it's time to go home.

Having put on your coat, and shouldered your backpack, you step out the front door with your bicycle (making sure that it's locked behind you). It's a dark evening, but your bike light is bright and warm. You hop on the reliable machine and head home.";
	wait for any key;
	say "[paragraph break]Or at least that's the plan. Unfortunately it all goes sideways as you approach the exit from Weaver's Park and try to apply the brakes on your bike to slow down. With a sudden 'snap!' one of the levers gives way, and you have a very exciting few seconds as you turn the bike to try to avoid sailing out into the road. Luckily you manage to avoid disaster, and you walk back to the Labs with your bicycle.

You take a moment to catch your breath, as you take off your coat and hang it up. 'This is fine', you think. The idea of walking home seems awful, but you're a resourceful sort. And you know you're in the perfect place to come up with an alternative solution. You'll apply your maker expertise, and you'll figure out how to...";
	wait for any key;
	say "[paragraph break]ESCAPE FROM FARSET LABS!";
	say "[paragraph break]Type 'help' if you need help.";
 

SECTION 2 - the map

The Lobby is a room. "You are standing in the lobby of Farset Labs. A door to the west leads into the common desks area, and a staircase leads up to the co-working floor. To the south is the exit from the building."

The Desk Area is west of the Lobby. "An open area filled with desks and monitors, suitable for sitting and coding. It's normally a lively area, though it's deserted this late. If it's peace and quiet you want, then upstairs from the lobby in the co-working area is a better bet. Various facilities are along the north wall, including the lounge. To the west is the events area, or you can head back east to the lobby."

The Lounge is north of the Desk Area. "The desk area forms a rough L-shape, and this northern part of the L serves as a lounge. There are some very comfortable sofas, and you're tired enough that they look pretty tempting. There's a small tuck shop here for snacks."

The Event Area is west of the Desk Area. "A large open area. Sometimes it's set up with tables for classes or events but currently it's empty. Various posters line the walls. To the west is the workshop, and back east is the desk area."

The Workshop is west of the Event Area. "A true maker's paradise, filled with tools and gadgets for crafting electronic devices. There's a small door on the north wall with 'NOT FOR STORAGE' written on it."

The Co-working Area is up from the Lobby. "A large open area filled with desks. A sign on the wall gives the rules for using the space."

[Let's redefine some directions for playability.]

Understand "upstairs" as up.

Instead of exiting:
	say "Go south from the lobby if you want to leave the building.";

[Finishing the game is about leaving the map, if you can.]

Instead of going south in the Lobby:
	if the bicycle is broken:
		say "You're going nowhere until you've fixed your bike.";
	otherwise if the player is not carrying the backpack and the player is not wearing the backpack:
		say "You can't leave without your backpack.";
	otherwise if the player is not carrying the USB and the USB is not in the backpack:
		say "You can't leave without your USB.";
	otherwise if the player is carrying the resin:
		say "You can't leave without giving the programmer back their resin.";
	otherwise:
		end the story saying "Having repaired your bike and tied up all the loose ends, you're finally able to grab your coat, hop on your bike, and head out into the crisp Belfast evening. Congratulations, you have...

ESCAPED FROM FARSET LABS!

At least until you come back here tomorrow, anyway.";
	
SECTION 3 - Objects

The player is wearing a backpack. The backpack is closed. The backpack is openable.

The description of the backpack is "It's battered, but you don't go anywhere without it."

[They can't see they have the laptop or USB until they think to open the backpack.]
The laptop is in the backpack. The description of the laptop is "An old and reliable friend. Except today, because the battery is flat and you forgot the charging cable."

The USB drive is in the backpack. The description of the USB drive is "A small portable data storage device, able to slot into all manner of devices." The USB drive can be full or empty. The USB is empty.

[Awkward name due to how Inform 7 handles nouns.]
The some loose change is an object. The description is "A collection of coins."

The coat is in the Lobby. "Your coat is hanging on the coat-rack." The description is "A comfortable dark blue windbreaker. There's a variety of things in the pockets." Understand "pockets" as the coat.

The bicycle is in the lobby. "Your bicycle is leaning against one of the walls." The bicycle can be broken or fixed. The bicycle is broken. The description is "Your trusty steed, and the only way you'd consider getting home[if the bicycle is broken] though you'll need to find some way to control the brakes first[end if]." Understand "bike" as the bicycle.

[Cheating a little here - Inform will treat the bicycle like a surface that can have things put on it now.]
The broken brake lever is on the bicycle.  The description is "A snapped brake lever, made from hard plastic. It dangles forlornly from its cable." 

The fridge is in the Lounge. "A small mini-fridge sits in one corner of the lounge as part of the tuck shop. It contains various soft drinks."  Understand "mini-fridge" as the fridge. The fridge is fixed in place. 

The fridge contains a Club Mate. The description of the Club Mate is "A sparkling caffeinated beverage, made from the yerba mate plant. It's very much an acquired taste, but most of the programmers here at the Labs love the stuff." Understand "drink" as the mate.

The toolrack is in the Workshop. "A toolrack hangs along the eastern wall." The toolrack is fixed in place. Rule for deciding the concealed possessions of the toolrack: yes. The description is "A collection of useful tools in various containers." Understand "rack" as the toolrack.

The screwdriver is in the toolrack. The description is "A small screwdriver, the right size for the screws on your brake handle."

The 3D scanner is in Workshop. "A large 3D scanner sits in one corner of the workshop." The 3D scanner is fixed in place. The description is "A 3D scanner. You could scan a small object in it, if you had a USB drive to save the results to."

The 3D printer is in the workshop. "A large 3D printer sits in another corner of the workshop." The 3D printer is fixed in place. The description is "A magical device that lets you create anything you want, as long as the thing you want is made out of a single piece of plastic. If you want to print something out then just 'use' the printer. There's a holder at the side for the plastic resin."

The repaired brake lever is a thing. The description is "A perfect replica of your brake lever. It's not the most sturdy, but it's good enough to get you home once you put it on your bike."

[The three-part state is to have it behave differently in the initial empty state versus when it's been used. There is probably a more elegant way to handle it.]
The holder is part of the 3D printer. The holder can be ready or unready or unneeded. The holder is unready. The description of the holder is "A small reservoir designed to hold the plastic resin you use to print something out. [if the holder is ready]It's got enough resin in it to print something out[otherwise]It's empty[end if]."

The Programmer is in the Co-working Area. "Someone else has stayed here late. A programmer is working away on some absorbing problem." 

[We hide their possessions so you can't see they have the resin.]
The Programmer is a person. The Programmer can be absorbed or attentive. The Programmer is absorbed. The description is "One of your fellow Farsetteers. They are absorbed in their work. An empty bottle of Club Mate is on the desk next to them." Rule for deciding the concealed possessions of the programmer: yes. 

The programmer holds the bottle of plastic resin. The description of the plastic resin is "A small bottle of plastic resin for use in a 3D printer."

SECTION 4 - Interrupts of actions

instead of giving the resin to the Programmer:
	if the holder is unready:
		say "You should probably hang onto that until you've used it.";
	otherwise:
		say "You put the bottle of resin on the desk next to the programmer. You don't think they notice.";
		remove the resin from play;
		increase the score by 1;

Instead of taking or dropping the laptop:
	say "Better not. You don't want to forget it."

Instead of taking something which is on the bicycle when the player is not carrying the screwdriver:
	say "You'll need to loosen the screws to do that."

Instead of taking something which is on the bicycle when the player is carrying the screwdriver:
	say "You loosen the screws and remove the broken brake lever.";
	move the broken brake lever to the player;
	increase the score by 1;

Instead of putting something on the bicycle:
	if the noun is the repaired brake lever and the player is carrying the screwdriver:
		say "You attach the brake lever to the bicycle with the screwdiver. Before you forget you go to the workshop and return it to the rack, before coming back to the lobby.";
		now the bicycle is fixed;
		remove the repaired brake lever from play;
		remove the screwdriver from play;
		increase the score by 2;
	otherwise if the noun is the repaired brake lever:
		say "You'll need the screwdriver for that.";
	otherwise if the noun is the broken brake lever:
		say "There's no point in putting that back on the bike, it's broken.";
	otherwise: 
		say "There's no point in putting that on the bicycle."

Instead of taking the coat:
	say "It's warm enough in here, so you don't feel like wearing your coat. If you want something from it, try searching it instead."
	
["for the first time" is needed to avoid an infinite score bug.]
Instead of searching the coat for the first time:
	say "You find a handful of loose change in the coat's pockets.";
	move some loose change to the player;
	increase the score by 1;

[We interrupt examining the fridge so it doesn't show the contents.]
Instead of examining the fridge:
	if the fridge contains the mate:
		say "The fridge contains a variety of soft drinks. The Club Mate catches your eye.";
	otherwise:
		say "None of what's left in the fridge particularly interests you.";

Instead of buying the mate:
	try taking the mate;


Instead of taking something which is in the fridge when the player is not carrying the some loose change:
	say "The honesty system forbids you from taking something without paying for it, and you've left your coins in your coat."
	
Instead of taking something which is in the fridge when the player is carrying the some loose change:
	say "You put the money for it in the honesty box, and take the Club Mate.";
	move the Club Mate to the player;
	increase the score by 1;

Instead of opening the fridge:
	try examining the fridge.
	
Instead of drinking the mate:
	say "You aren't thirsty, but maybe someone else is.";
	
Instead of inserting something into the fridge:
	say "The fridge is part of the tuck shop, it's not for general storage."

Instead of examining the toolrack when the screwdriver is in the toolrack:
	say "You notice a screwdriver that would work for removing your broken brake lever and take it.";
	move the screwdriver to the player;
	increase the score by 2;

Instead of inserting something into the 3D scanner:
	say "Use 'scan object' to scan it."
			
Instead of inserting something into the holder:
	say "It wouldn't fit. If you want to put a liquid in the holder, pour it in."
	
Instead of going north in the Workshop:
	say "You can't get the door open because of all the stuff stored in there."

Instead of giving the Club Mate to the Programmer:
	say "The programmer grabs the Club Mate from your hand, flicking the lid off in an astounding display of finger strength. They drink half the bottle in one swallow, then look around and notice you for the first time.";
	say "The programmer pops their earphones out and says: 'Hi! Thanks for that. What's up?'";
	now the Programmer is attentive;
	move the Club Mate to the Programmer;
	increase the score by 3;
	now the description of the Programmer is "One of your fellow Farsetteers. They are looking at you attentively to see what you need. Try talking to them."
	
Instead of opening the mate:
	say "But then all the fizz will go out of it!";

SECTION 5 - Custom actions

Using is an action applying to one thing. Understand "use [something]" as using.

check using:
	if the noun is the printer and the holder is ready and the usb is visible and the usb is full:
		say "You create a perfect replica of the broken brake lever, except (crucially) not broken. Since you no longer need the broken one, you drop it in a recycle bin.";
		move the repaired brake lever to the player;
		remove the broken brake lever from play;
		now the holder is unneeded;
		increase the score by 5;
	otherwise if the noun is the printer and the holder is ready and the usb is visible:
		say "You'd need some schematics of something you scanned in so that you can print it out.";
	otherwise if the noun is the printer and the holder is ready:
		say "You need a USB with schematics to plug into the printer.";
	otherwise if the noun is the printer:
		say "You can't print anything out without any resin in the printer.";
	otherwise if the noun is the scanner:
		say "If you want to scan something, just type 'scan (something)'.";
	otherwise if the noun is the mate and the programmer is visible:
		try giving the mate to the programmer;
	otherwise:
		say "Use it for what?";

Using it on is an action applying to two things. Understand "use [something] on [something]" as using it on.
	
Check using it on:
	if the noun is the screwdriver and the second noun is the bicycle and the broken brake lever is on the bicycle:
		try taking the lever;
	otherwise if the noun is the screwdriver and the second noun is the broken brake lever and the broken brake lever is on the bicycle:
		try taking the lever;
	otherwise if the noun is the mate and the second noun is the programmer:
		try giving the mate to the programmer;
	
Scanning is an action applying to one carried thing. Understand "scan [something]" as scanning.

Check scanning:
	if the location is not the Workshop:
		say "You'd need to use a 3D scanner for that.";
	otherwise if the noun is the broken brake lever:
		if the USB drive is full:
			say "You already did that.";
		otherwise if the player carries the broken brake lever and the USB drive is visible:
			say "You put the broken brake lever into the scanner, arranging it so the cracked edges are flush against each other. Then you plug the USB drive into the scanner and download a scan of the broken lever to it.";
			now the USB drive is full;
			increase the score by 3;
		otherwise:
			say "You'll need a USB drive for that.";
	otherwise:
		say "There's no point in scanning [the noun]."
		
Pouring it into is an action applying to two visible things. 
Understand "pour [something preferably held] into [something]" as pouring it into.
Understand "pour [something preferably held] in [something]" as pouring it into.

Check pouring it into:
	if the noun is the resin and the second noun is the holder and the holder is unready:
		say "You pour enough resin into the holder to print out one medium-sized plastic object.";
		now the holder is ready;
	otherwise if the noun is the resin and the second noun is the holder and the holder is ready:
		say "There's no point in adding more resin.";
	otherwise if the noun is the resin and the second noun is the holder and the holder is unneeded:
		say "You've already printed the new lever, there's no point in adding more resin.";
	otherwise if the noun is the mate and the second noun is the holder:
		say "That would be a waste of a perfectly fine beverage, and not very good for the printer.";
	otherwise if the noun is the resin:
		say "That would be a waste, and make a mess.";
	otherwise if the noun is the mate:
		say "That would be a waste, and make a mess.";
	otherwise:
		say "That's not something you can pour.";
		
		
Talking is an action applying to one thing. Understand "talk [someone]" as talking. Understand "talk to [someone]" as talking.

check talking:
	if the noun is not the Programmer: 
		say "You have a fascinating, if one-sided, conversation with it.";
	otherwise if the Programmer is absorbed and the Programmer holds the resin:
		say "No joy, they're way too intent on their work. You'll need to capture their attention somehow.";
	otherwise if the Programmer is absorbed:
		say "They're back at work, as absorbed as ever. You hope they remember to go home some time.";
	otherwise if the Programmer holds the plastic resin:
		say "'Thanks for the drink,' they say. 'I lost track of time - you know how it is. How come you're still here?'";
		say "You explain your problem. They grin, and hand you something.";
		say "'This should help, I think,' they say. 'Just drop it back up here when you're done.'";
		move the resin to the player;
		increase the score by 1;
		now the Programmer is absorbed;
		now the description of the Programmer is "They're back at work, as absorbed as ever. You hope they remember to go home some time.";

SECTION 7 - Easter eggs

The BSides Belfast poster is in the Event Area. "A bright orange and red poster catches your eye." The poster is fixed in place. The description is "A poster for BSides Belfast 2023, a local information security conference. It shows a magnificent drawing of a phoenix roosting on the Harland and Woolf cranes that form part of the BSides Belfast logo. It doesn't help you with your current problems, but it does cheer you up to remember there is more to life than this."

The NIDC poster is in the Desk Area. "An NIDC poster is hung on the wall." The poster is fixed in place. The description is "This poster advertises NIDC's meetup week, where they team up with smaller IT community get-togethers to run a series of events showcasing the work local developers are doing. It doesn't help you with your current problems, but it does inspire you to think that there must be a creative solution to your problem."

The Battlebots Arena is in the workshop. "The Battlebots Arena lurks between the 3D printer and the 3D scanner." The description is "This perspex cube is transported to various locations around Ireland by the HackrBattlebots team for small robotic gladiators to fight it out. DuckBot, a personal favourite, is sitting in the middle of the arena. It doesn't help directly in your current predicament, but it fires up your spirit and inspires you to keep going on."  The arena is fixed in place.

[We want to make the door an object so we can do the joke, but we don't want to to appear as one in the room, so it's 'undescribed'. This is very handy for puzzles.]
The small door is in the workshop. The small door is undescribed. The small door is fixed in place.

Instead of going north in the Workshop:
	say "You can't get the door open because of all the stuff stored in there."

Instead of opening the small door:
	say "You can't get the door open because of all the stuff stored in there."

[The description here is worded to take account of the fact that 'read' is treated as a synonym of 'examine' by default.]
The stack of comics is in the lounge. "A pile of comics on a table next to some soft seats tempts you." The description of the comics is "You'd love to sit down and read your way through the stack, but it's getting late and you want to get home."

instead of taking the comics:
	say "They're not yours, so you should leave them for other people to read."

The green plastic skull is in the lounge. "A green plastic skull grins toothily at you from a shelf." The description is "A green skull, 3D printed in durable plastic. [if the holder is not unneeded]The sight of it suggests a possible solution to your problem[otherwise]You hope the plastic is durable enough to hold up as a brake lever[end if]."

Instead of taking the skull:
	say "You couldn't possibly desecrate a fixture of the labs like that."

The graffiti is in the event area. "Colourful graffiti is chalked all over the walls." The graffiti is fixed in place.

[This is entirely to show off how you can randomise things.]
A scribble is a kind of thing.

The first scrawl is an object. The first scrawl is a scribble. The description is "Someone has written 'KILROY WOZ HERE'. How original."

The second scrawl is an object. The second scrawl is a scribble. The description is "You spot the slogan'HACK THE PLANET!!' Must be from movie night."

The third scrawl is an object. The third scrawl is a scribble. The description is "You see an artistically excellent drawing of the Belfast cranes, destined to vanish when the chalk is cleaned."

The fourth scrawl is an object. The fourth scrawl is a scribble. The description is "You see Bob. You hope Bob doesn't see you.".

instead of examining the graffiti:
	say the description of a random scribble.

SECTION 7 - Help and other text dumps

Help is an action applying to nothing. Understand "help" as help.

Check help:
	say "Hello and welcome to ‘Escape From Farset Labs’, a light-hearted short interactive fiction game created as an example for the Northern Ireland Developers Conference 2024. If you’ve never played a game like this before, the idea is that you type in commands to carry out actions. The aim is to figure out how to repair your bike so you can leave the labs and go home. 

If you're completely new to the concept of interactive fiction, then check out the Interactive Fiction Overview linked in the sidebar. There's also an IF Basics one-page guide.

Alternatively you can type in ‘help-commands’ to get a list of basic commands, or ‘help-spoiler-commands' to get a list of everything you can do. (As the name suggests, this will spoil a few puzzles.) 

Finally if you’ve never heard of Farset Labs, type in ‘who-are-farset’ to learn more about it."
	
Help-commands is an action applying to nothing. Understand "help-commands" as help-commands.

Check help-commands:
	say "Use the following basic commands to play this game:

- Enter a direction (north, south, east, west, up, or down) to move. You can also just enter the first letter of a direction.

- Enter 'inventory' (or 'inv', or 'i') so see what you're carrying.

- You can 'get' an item to try and pick it up, and 'drop' an item to put it down.

- If you want to learn more about an item you can 'examine' (or 'x') it.

There are a lot of other things you can do too. For a full list of available commands used in this game, enter 'help-spoiler-commands'."
	
Help-spoiler-commands is an action applying to nothing. Understand "help-spoiler-commands" as help-spoiler-commands.

Check help-spoiler-commands:
	say "The following commands are used in this game:

north
south
east
west
up
down
examine
inventory
get
put
search
give
open
scan
print
talk
use

In some cases alternative words will work."
	
Who-are-farset is an action applying to nothing. Understand "who-are-farset" as who-are-farset.

Check who-are-farset:
	say "Farset Labs are a Belfast-based open community of students, professionals, academics, freelancers, artists, hackers, and organizers that believe strongly in experimental learning and the Do-It-Yourself ethic. We facilitate technology initiatives and encourage hands-on learning by maintaining a workshop and creative space that is available to members. We maintain an inclusive membership policy, and strive to apply the principles of the open-software and open-hardware movements within our design policies. The name 'Farset' comes from the ancient river that Belfast is built on. To learn more visit https://www.farsetlabs.org.uk."
	

SECTION 7 - Testing

Test first with "search coat / w / n / get mate / s / e / u / give mate / talk / d".

Test second with "w / w / w / x rack / e / e / e / get lever / w / w / w ".

Test third with "open backpack / scan lever / pour resin into holder / use printer".

Test fourth with "e / e / e / put repaired lever on bike / u / give resin / d / s".

Test me with "test first / test second / test third / test fourth".

Test mapwalking with "w / n / s / w / w / e / e / e / u / d"

Test eggs with "w / n / x skull / get skull / x comics / get comics / s / w / x graffiti / x poster / w / x arena /open door / e / e / e".

