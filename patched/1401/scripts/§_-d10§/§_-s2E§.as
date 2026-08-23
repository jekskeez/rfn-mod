package §_-d10§
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import utils.§_-x1Z§;
   
   public class §_-s2E§ extends Sprite
   {
      
      public static const §_-jI§:int = 0;
      
      public static const §_-71a§:int = 1;
      
      public static const §_-42M§:int = 2;
      
      private static const §_-l19§:Array = [gls("Куплен"),gls("Закрыт"),gls("Надет")];
      
      private static const §_-b23§:Array = [null,[§_-x1Z§.§_-J1U§],null];
      
      private var §_-b2s§:DisplayObject = null;
      
      private var field:§_-22V§ = null;
      
      private var _type:int = -1;
      
      public function §_-s2E§(param1:int)
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
         if(this.§_-b2s§)
         {
            removeChild(this.§_-b2s§);
         }
         if(this.field)
         {
            removeChild(this.field);
         }
         this.§_-b2s§ = new RibbonEdge();
         if(§_-b23§[this.type] != null)
         {
            this.§_-b2s§.filters = §_-b23§[this.type];
         }
         addChild(this.§_-b2s§);
         this.field = new §_-22V§(§_-l19§[this.type],0,3,new TextFormat(§_-22V§.§_-pJ§,14,16777215));
         this.field.x = 50 - int(this.field.textWidth * 0.5);
         addChild(this.field);
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}

