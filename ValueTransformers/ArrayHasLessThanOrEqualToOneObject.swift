/*******************************************************************************
 * Copyright (c) 2025, DigiDNA
 * All rights reserved
 *
 * Unauthorised copying of this copyrighted work, via any medium is strictly
 * prohibited.
 * Proprietary and confidential.
 ******************************************************************************/

import Foundation

@objc( VTArrayHasLessThanOrEqualToOneObject )
public class ArrayHasLessThanOrEqualToOneObject: ValueTransformer
{
    @objc
    public override class func transformedValueClass() -> AnyClass
    {
        return NSNumber.self
    }

    @objc
    public override class func allowsReverseTransformation() -> Bool
    {
        return false
    }

    @objc
    public override func transformedValue( _ value: Any? ) -> Any?
    {
        guard let array = value as? NSArray
        else
        {
            return NSNumber( booleanLiteral: false )
        }

        return array.count <= 1 ? NSNumber( booleanLiteral: true ) : NSNumber( booleanLiteral: false )
    }
}
