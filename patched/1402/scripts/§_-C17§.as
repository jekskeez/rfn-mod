package
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.utils.getDefinitionByName;
   import utils.§_-h25§;
   import views.§_-xl§;
   
   public class §_-C17§ extends Sprite
   {
      
      private var smiles:Object = {};
      
      private var §_-a2y§:§_-h25§ = null;
      
      public function §_-C17§()
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
            if(param1 >= Hero.§_-113§)
            {
               _loc2_ = §_-xl§.§_-z2k§[param1 - Hero.§_-113§];
               _loc3_ = new _loc2_["btn"]();
               _loc3_.scaleX = _loc3_.scaleY = 1.2;
               this.smiles[param1] = new §_-h25§(_loc3_);
               this.smiles[param1].x = -17;
               this.smiles[param1].y = (-45 + ("shift" in _loc2_ ? _loc2_["shift"] : 0)) * this.scaleY;
            }
         }
         this.§_-a2y§ = this.smiles[param1];
         addChild(this.§_-a2y§);
         this.visible = true;
         this.§_-a2y§.speed = 0.5;
         this.§_-a2y§.addFrameScript(this.§_-a2y§.totalFrames - 1,this.remove);
         this.§_-a2y§.gotoAndPlay(0);
      }
      
      public function remove() : void
      {
         if(!this.visible)
         {
            return;
         }
         this.visible = false;
         this.alpha = 1;
         if(this.§_-a2y§ == null)
         {
            return;
         }
         this.§_-a2y§.stop();
         if(contains(this.§_-a2y§))
         {
            removeChild(this.§_-a2y§);
         }
         this.§_-a2y§ = null;
      }
   }
}

