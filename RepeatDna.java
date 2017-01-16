import java.util.*;


public class RepeatDna {

	public static void main(String[] args)
	{
		// TODO Auto-generated method stub
		List<String> results = findRepeatedDnaSequences(args[0]);
		for (String r : results)
			System.out.println(r);
	}

    static public List<String> findRepeatedDnaSequences(String s)
    {
        List<String> RepeatedDnas = new ArrayList<String>();
        if (s.length() <= 10 ) return RepeatedDnas;
        int[] prefices = new int[s.length() - 9];
        for (int i = 0; i < s.length() - 9; i++) prefices[i] = i;
        SortPrefices(prefices, s.toCharArray(), s.length() - 9);
        boolean repeated = false;
        for (int i = 0; i < s.length() - 10; i++)
        {
            boolean checkrepeated = (CompareTenChars(prefices[i], prefices[i + 1], s.toCharArray()) == 0);
            if (repeated)
            {
                if (!checkrepeated) repeated = false;
            }
            else
            {
                if (checkrepeated)
                {
                    repeated = true;
                    RepeatedDnas.add(s.substring(10));
                }
            }
        }
        return RepeatedDnas;
    }
    
    static int CompareTenChars(int pos1, int pos2, char[] buffer)
    {
        int diff = 0, len = buffer.length;
        for (int i = 0; i < 10 && diff == 0 && pos1 < len && pos2 < len; pos1++, pos2++)
        {
            diff = Character.compare(buffer[pos1], buffer[pos2]);
        }
        if (diff == 0)
        {
            if (pos1 == len) diff = -1;
            else if (pos2 == len) diff = 1;
        }
        return diff;
    }
    
    static void SortPrefices(int[] prefices, char[] charArray, int len)
    {
        SortPreficesHelp(prefices, charArray, 0, len - 1, len);
    }
    
    static void SortPreficesHelp(int[] prefices, char[] charArray, int iStart, int iEnd, int len)
    {
        int mid = (iStart + iEnd) / 2, iiStart = iStart, iiEnd = iEnd - 1;
        int iTemp = prefices[mid];
        prefices[mid] = prefices[iEnd];
        prefices[iEnd] = iTemp;
        while (iiStart < iiEnd)
        {
            while (CompareTenChars(prefices[iiStart], prefices[iEnd], charArray) < 0) iiStart++;
            while (CompareTenChars(prefices[iiEnd], prefices[iEnd], charArray) >= 0) iiEnd--;
            if (iiStart < iiEnd)
            {
                iTemp = prefices[iiStart];
                prefices[iiStart] = prefices[iiEnd];
                prefices[iiEnd] = iTemp;
            }
        }
        iTemp = prefices[iiStart];
        prefices[iiStart] = prefices[iEnd];
        prefices[iEnd] = iTemp;
        SortPreficesHelp(prefices, charArray, iStart, iiStart - 1, len);
        SortPreficesHelp(prefices, charArray, iiStart, iEnd, len);
    }
}
