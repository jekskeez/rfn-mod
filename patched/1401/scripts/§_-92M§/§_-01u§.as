package §_-92M§
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   
   public class §_-01u§ extends Sprite
   {
      
      private static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,16777215,true);
      
      private static const §_-b23§:DropShadowFilter = new DropShadowFilter(0,0,206672,8,8,4);
      
      private var icon:DisplayObject = null;
      
      private var field:§_-22V§ = null;
      
      public function §_-01u§(param1:Class, param2:Number)
      {
         super();
         this.field = new §_-22V§("0",0,-2,§_-i2c§);
         this.field.filters = [§_-b23§];
         addChild(this.field);
         this.icon = new param1();
         this.icon.scaleX = this.icon.scaleY = param2;
         addChild(this.icon);
      }
      
      public function set text(param1:String) : void
      {
         this.field.text = param1;
         this.field.x = 0;
         this.icon.x = this.field.x + this.field.textWidth + 5;
      }
      
      public function set color(param1:int) : void
      {
         var _loc2_:TextFormat = this.field.getTextFormat();
         _loc2_.color = param1;
         this.field.defaultTextFormat = _loc2_;
         this.field.setTextFormat(_loc2_);
      }
      
      public function set §_-A3§(param1:Array) : void
      {
         this.field.filters = param1;
      }
   }
}

