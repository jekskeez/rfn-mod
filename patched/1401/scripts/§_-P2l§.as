package
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.utils.getDefinitionByName;
   import utils.§_-i2C§;
   import views.§_-l1b§;
   
   public class §_-P2l§ extends Sprite
   {
      
      private var smiles:Object = {};
      
      private var §_-c2i§:§_-i2C§ = null;
      
      public function §_-P2l§()
      {
         super();
      }
      
      public function dispose() : void
      {
      }
      
      public function set emotion(param1:int) : void
      {
         var _loc2_:Object = null;
         var _loc3_:MovieClip = null;
         if(!(param1 in this.smiles))
         {
            if(param1 >= Hero.§_-wo§)
            {
               _loc2_ = §_-l1b§.§_-02E§[param1 - Hero.§_-wo§];
               _loc3_ = new _loc2_["btn"]();
               _loc3_.scaleX = _loc3_.scaleY = 1.2;
               this.smiles[param1] = new §_-i2C§(_loc3_);
               this.smiles[param1].x = -17;
               this.smiles[param1].y = (-45 + ("shift" in _loc2_ ? _loc2_["shift"] : 0)) * this.scaleY;
            }
         }
         this.§_-c2i§ = this.smiles[param1];
         addChild(this.§_-c2i§);
         this.visible = true;
         this.§_-c2i§.speed = 0.5;
         this.§_-c2i§.addFrameScript(this.§_-c2i§.totalFrames - 1,this.remove);
         this.§_-c2i§.gotoAndPlay(0);
      }
      
      public function remove() : void
      {
         if(!this.visible)
         {
            return;
         }
         this.visible = false;
         this.alpha = 1;
         if(this.§_-c2i§ == null)
         {
            return;
         }
         this.§_-c2i§.stop();
         if(contains(this.§_-c2i§))
         {
            removeChild(this.§_-c2i§);
         }
         this.§_-c2i§ = null;
      }
   }
}

