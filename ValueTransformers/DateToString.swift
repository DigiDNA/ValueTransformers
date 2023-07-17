/*******************************************************************************
 * Copyright (c) 2023, DigiDNA
 * All rights reserved
 *
 * Unauthorised copying of this copyrighted work, via any medium is strictly
 * prohibited.
 * Proprietary and confidential.
 ******************************************************************************/

import Cocoa

@objc( VKDateToString )
open class DateToString: ValueTransformer
{
    private static var dateFormatter: DateFormatter?

    open override class func transformedValueClass() -> AnyClass
    {
        return NSString.self
    }

    open override class func allowsReverseTransformation() -> Bool
    {
        return false
    }

    open override func transformedValue( _ value: Any? ) -> Any?
    {
        guard let date = value as? Date
        else
        {
            return nil
        }

        if DateToString.dateFormatter == nil
        {
            let dateFormatter = DateFormatter()

            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .medium
            
            DateToString.dateFormatter = dateFormatter
        }

        guard let dateFormatter = DateToString.dateFormatter
        else
        {
            return nil
        }

        return dateFormatter.string( from: date )
    }
}
