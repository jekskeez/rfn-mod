package §_-Qy§
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import utils.§_-y1l§;
   
   public class §_-RT§ extends Sprite
   {
      
      public static const §_-ZS§:int = 0;
      
      public static const §_-81T§:int = 1;
      
      public static const §_-11J§:int = 2;
      
      private static const §_-z1y§:Array = [gls("Куплен"),gls("Закрыт"),gls("Надет")];
      
      private static const §_-21n§:Array = [null,[§_-y1l§.§_-Y14§],null];
      
      private var §_-s2§:DisplayObject = null;
      
      private var field:§_-i5§ = null;
      
      private var _type:int = -1;
      
      public function §_-RT§(param1:int)
      {
         super();
         this.type = param1;
      }
      
      public function set type(param1:int) : void
      {
         if(this.type == param1)
         {
            return;
         }
         this._type = param1;
         if(this.§_-s2§)
         {
            removeChild(this.§_-s2§);
         }
         if(this.field)
         {
            removeChild(this.field);
         }
         this.§_-s2§ = new RibbonEdge();
         if(§_-21n§[this.type] != null)
         {
            this.§_-s2§.filters = §_-21n§[this.type];
         }
         addChild(this.§_-s2§);
         this.field = new §_-i5§(§_-z1y§[this.type],0,3,new TextFormat(§_-i5§.§_-p1s§,14,16777215));
         this.field.x = 50 - int(this.field.textWidth * 0.5);
         addChild(this.field);
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}

