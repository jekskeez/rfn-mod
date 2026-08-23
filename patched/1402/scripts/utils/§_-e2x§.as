package utils
{
   import §_-22D§.§_-C2E§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class §_-e2x§ extends Sprite
   {
      
      private var §_-33R§:DisplayObject = null;
      
      private var §_-23X§:DisplayObject = null;
      
      private var §_-x2O§:DisplayObject = null;
      
      private var §_-E1x§:int;
      
      private var §_-A1r§:int;
      
      private var §_-Ju§:int;
      
      private var §_-53y§:Boolean = false;
      
      private var §_-bX§:int = 0;
      
      private var §_-Ht§:int = 0;
      
      public function §_-e2x§(param1:Array, param2:Boolean = false)
      {
         super();
         this.init(param1,param2);
      }
      
      public function §_-638§(param1:Boolean) : void
      {
         if(!this.§_-x2O§)
         {
            return;
         }
         this.§_-53y§ = param1;
         if(this.§_-53y§)
         {
            this.§_-x2O§.width = this.§_-23X§.width;
         }
         else
         {
            this.§_-23X§.width = this.§_-x2O§.width;
         }
         this.§_-x2O§.visible = this.§_-53y§;
         this.§_-23X§.visible = !this.§_-53y§;
         this.§_-d1Z§(this.§_-bX§,this.§_-Ht§);
      }
      
      public function §_-a2L§() : int
      {
         return this.§_-53y§ ? int(this.§_-x2O§.width) : int(this.§_-23X§.width);
      }
      
      public function §_-d1Z§(param1:int, param2:int, param3:Number = 0.5) : void
      {
         this.§_-bX§ = param1;
         this.§_-Ht§ = param2;
         if(this.§_-Ht§ < this.§_-bX§)
         {
            this.§_-bX§ = this.§_-Ht§;
         }
         var _loc4_:int = this.§_-53y§ ? this.§_-Ju§ : this.§_-A1r§;
         var _loc5_:DisplayObject = this.§_-53y§ ? this.§_-x2O§ : this.§_-23X§;
         var _loc6_:Number = _loc4_ * (this.§_-bX§ / this.§_-Ht§);
         §_-C2E§.to(_loc5_,param3,{"width":_loc6_});
      }
      
      private function init(param1:Array, param2:Boolean) : void
      {
         this.§_-n2w§(param1[0]["image"],param1[0]["X"],param1[0]["Y"]);
         this.§_-131§(param1[1]["image"],param1[1]["X"],param1[1]["Y"]);
         this.§_-A1r§ = param1[1]["width"];
         if(param1.length > 2)
         {
            this.§_-02a§(param1[2]["image"],param1[2]["X"],param1[2]["Y"]);
            this.§_-Ju§ = param1[2]["width"];
         }
         this.§_-d1Z§(0,1,0);
         this.§_-E1x§ = param1[1]["X"];
         if(param2)
         {
            addChild(this.§_-33R§);
         }
      }
      
      private function §_-n2w§(param1:DisplayObject, param2:int, param3:int) : void
      {
         this.§_-33R§ = param1;
         this.§_-33R§.x = param2;
         this.§_-33R§.y = param3;
         addChild(this.§_-33R§);
      }
      
      private function §_-131§(param1:DisplayObject, param2:int, param3:int) : void
      {
         this.§_-23X§ = param1;
         this.§_-23X§.x = param2;
         this.§_-23X§.y = param3;
         addChild(this.§_-23X§);
      }
      
      private function §_-02a§(param1:DisplayObject, param2:int, param3:int) : void
      {
         this.§_-x2O§ = param1;
         this.§_-x2O§.x = param2;
         this.§_-x2O§.y = param3;
         this.§_-x2O§.visible = false;
         addChild(this.§_-x2O§);
      }
   }
}

