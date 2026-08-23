package dragonBones.objects
{
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   
   public final class TransformFrame extends Frame
   {
      
      public var tweenEasing:Number;
      
      public var tweenRotate:int;
      
      public var displayIndex:int;
      
      public var visible:Boolean;
      
      public var zOrder:Number;
      
      public var global:DBTransform;
      
      public var transform:DBTransform;
      
      public var pivot:Point;
      
      public var color:ColorTransform;
      
      public function TransformFrame()
      {
         super();
         this.tweenEasing = 0;
         this.tweenRotate = 0;
         this.displayIndex = 0;
         this.visible = true;
         this.zOrder = NaN;
         this.global = new DBTransform();
         this.transform = new DBTransform();
         this.pivot = new Point();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.global = null;
         this.transform = null;
         this.pivot = null;
         this.color = null;
      }
   }
}

