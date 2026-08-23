package §_-HG§
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   
   public class §_-51v§ extends Sprite
   {
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,16777215,true);
      
      private static const §_-21n§:DropShadowFilter = new DropShadowFilter(0,0,206672,8,8,4);
      
      private var icon:DisplayObject = null;
      
      private var field:§_-i5§ = null;
      
      public function §_-51v§(param1:Class, param2:Number)
      {
         super();
         this.field = new §_-i5§("0",0,-2,§_-W2P§);
         this.field.filters = [§_-21n§];
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
      
      public function set §_-U4§(param1:Array) : void
      {
         this.field.filters = param1;
      }
   }
}

