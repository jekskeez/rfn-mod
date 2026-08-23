package dragonBones.objects
{
   public class Frame
   {
      
      public var position:Number;
      
      public var duration:Number;
      
      public var action:String;
      
      public var event:String;
      
      public var sound:String;
      
      public function Frame()
      {
         super();
         this.position = 0;
         this.duration = 0;
      }
      
      public function dispose() : void
      {
      }
   }
}

