/****************************************************************************
    MailListStat - print useful statistics on email messages
    Output of stats header file
    Copyright (C) 2001-2003  Marek Podmaka

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 ****************************************************************************/

#ifndef	_MLS_TEXT_H
#define	_MLS_TEXT_H	1
#define SNUMB_LEN       4

/* ********************************************* FUNCTION DECLARATIONS *** */
long GetCount(nTptr);
long GetSum(long [], int);
long GetSumZoz(nTptr, int);
long GetSumZozQ(nTptr);
void PrintTop(nTptr, int);
void PrintTopQ(nTptr, int);
void PrintTopHtml(nTptr, int);
void PrintGraph(long[], int, int);
void PrintGraphHtml(long[], long[][SNUMB_LEN], int, char *);

void PrintStatText(int, char *);
void PrintStatHtml(int, char *, short);

#endif /* mls_text.h */
