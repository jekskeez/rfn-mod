package §_-o1G§
{
   import §_-42B§.§_-y2k§;
   
   public class §_-nN§ extends §_-d1r§
   {
      
      public static const API:Number = 1;
      
      public function §_-nN§()
      {
         super();
         this.propName = "bezierThrough";
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:§_-y2k§) : Boolean
      {
         if(!(param2 is Array))
         {
            return false;
         }
         init(param3,param2 as Array,true);
         return true;
      }
   }
}

