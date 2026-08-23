package starling.textures
{
   import §_-kW§.§_-F2U§;
   import flash.display3D.Context3D;
   import flash.display3D.VertexBuffer3D;
   import flash.display3D.textures.TextureBase;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import starling.core.Starling;
   import starling.core.§_-T2v§;
   import starling.display.BlendMode;
   import starling.display.DisplayObject;
   import starling.display.§_-jH§;
   import starling.filters.FragmentFilter;
   import starling.utils.§_-Y23§;
   import starling.utils.execute;
   import starling.utils.getNextPowerOfTwo;
   
   public class RenderTexture extends SubTexture
   {
      
      private static var §_-A3i§:Rectangle = new Rectangle();
      
      public static var §_-o1v§:Boolean = false;
      
      private const §_-d7§:String = "RenderTexture.supportsNonPotDimensions";
      
      private const §_-u2n§:Boolean = true;
      
      private var §_-G2S§:Texture;
      
      private var §_-623§:Texture;
      
      private var §_-z1§:§_-jH§;
      
      private var §_-J2U§:Boolean;
      
      private var §_-C1F§:Boolean;
      
      private var §_-d1W§:Boolean;
      
      private var §_-O2j§:§_-T2v§;
      
      public function RenderTexture(param1:int, param2:int, param3:Boolean = true, param4:Number = -1, param5:String = "bgra", param6:Boolean = false)
      {
         if(param4 <= 0)
         {
            param4 = Starling.§_-61w§;
         }
         var _loc7_:Number = param1;
         var _loc8_:Number = param2;
         if(!this.supportsNonPotDimensions)
         {
            _loc7_ = getNextPowerOfTwo(param1 * param4) / param4;
            _loc8_ = getNextPowerOfTwo(param2 * param4) / param4;
         }
         this.§_-G2S§ = Texture.§_-31k§(_loc7_,_loc8_,true,false,true,param4,param5,param6);
         this.§_-G2S§.root.§_-x2b§ = this.§_-G2S§.root.clear;
         super(this.§_-G2S§,new Rectangle(0,0,param1,param2),true,null,false);
         var _loc9_:Number = this.§_-G2S§.root.width;
         var _loc10_:Number = this.§_-G2S§.root.height;
         this.§_-d1W§ = param3;
         this.§_-O2j§ = new §_-T2v§();
         this.§_-O2j§.§_-w2Q§(0,0,_loc9_,_loc10_,param1,param2);
         if(param3 && (!§_-o1v§ || !§_-Y23§.§_-sA§))
         {
            this.§_-623§ = Texture.§_-31k§(_loc7_,_loc8_,true,false,true,param4,param5,param6);
            this.§_-623§.root.§_-x2b§ = this.§_-623§.root.clear;
            this.§_-z1§ = new §_-jH§(this.§_-623§);
            this.§_-z1§.smoothing = §_-a1g§.NONE;
         }
      }
      
      override public function dispose() : void
      {
         this.§_-O2j§.dispose();
         this.§_-G2S§.dispose();
         if(this.§_-51y§)
         {
            this.§_-623§.dispose();
            this.§_-z1§.dispose();
         }
         super.dispose();
      }
      
      public function draw(param1:DisplayObject, param2:Matrix = null, param3:Number = 1, param4:int = 0) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.§_-J2U§)
         {
            this.render(param1,param2,param3);
         }
         else
         {
            this.§_-bf§(this.render,param1,param2,param3,param4);
         }
      }
      
      public function §_-9p§(param1:Function, param2:int = 0) : void
      {
         this.§_-bf§(param1,null,null,1,param2);
      }
      
      private function render(param1:DisplayObject, param2:Matrix = null, param3:Number = 1) : void
      {
         var _loc4_:FragmentFilter = param1.filter;
         var _loc5_:DisplayObject = param1.mask;
         this.§_-O2j§.§_-d2g§();
         this.§_-O2j§.blendMode = param1.blendMode == BlendMode.AUTO ? BlendMode.NORMAL : param1.blendMode;
         if(param2)
         {
            this.§_-O2j§.§_-nn§(param2);
         }
         else
         {
            this.§_-O2j§.§_-62B§(param1);
         }
         if(_loc5_)
         {
            this.§_-O2j§.§_-j2m§(_loc5_);
         }
         if(_loc4_)
         {
            _loc4_.render(param1,this.§_-O2j§,param3);
         }
         else
         {
            param1.render(this.§_-O2j§,param3);
         }
         if(_loc5_)
         {
            this.§_-O2j§.§_-k24§();
         }
      }
      
      private function §_-bf§(param1:Function, param2:DisplayObject = null, param3:Matrix = null, param4:Number = 1, param5:int = 0) : void
      {
         var previousRenderTarget:Texture;
         var tmpTexture:Texture = null;
         var renderBlock:Function = param1;
         var object:DisplayObject = param2;
         var matrix:Matrix = param3;
         var alpha:Number = param4;
         var antiAliasing:int = param5;
         var context:Context3D = Starling.context;
         if(context == null)
         {
            throw new §_-F2U§();
         }
         if(!Starling.§_-y1l§.§_-q1S§)
         {
            return;
         }
         if(this.§_-51y§)
         {
            tmpTexture = this.§_-G2S§;
            this.§_-G2S§ = this.§_-623§;
            this.§_-623§ = tmpTexture;
            this.§_-z1§.texture = this.§_-623§;
         }
         previousRenderTarget = this.§_-O2j§.renderTarget;
         §_-A3i§.setTo(0,0,this.§_-G2S§.width,this.§_-G2S§.height);
         this.§_-O2j§.§_-i1b§(§_-A3i§);
         this.§_-O2j§.§_-m8§(this.§_-G2S§,antiAliasing);
         if(this.§_-51y§ || !this.§_-Km§ || !this.§_-C1F§)
         {
            this.§_-O2j§.clear();
         }
         if(this.§_-51y§ && this.§_-C1F§)
         {
            this.§_-z1§.render(this.§_-O2j§,1);
         }
         else
         {
            this.§_-C1F§ = true;
         }
         try
         {
            this.§_-J2U§ = true;
            execute(renderBlock,object,matrix,alpha);
         }
         finally
         {
            this.§_-J2U§ = false;
            this.§_-O2j§.§_-A1U§();
            this.§_-O2j§.nextFrame();
            this.§_-O2j§.renderTarget = previousRenderTarget;
            this.§_-O2j§.§_-L2f§();
         }
      }
      
      public function clear(param1:uint = 0, param2:Number = 0) : void
      {
         if(!Starling.§_-y1l§.§_-q1S§)
         {
            return;
         }
         var _loc3_:Texture = this.§_-O2j§.renderTarget;
         this.§_-O2j§.renderTarget = this.§_-G2S§;
         this.§_-O2j§.clear(param1,param2);
         this.§_-O2j§.renderTarget = _loc3_;
         this.§_-C1F§ = true;
      }
      
      private function get supportsNonPotDimensions() : Boolean
      {
         var texture:TextureBase = null;
         var buffer:VertexBuffer3D = null;
         var target:Starling = Starling.§_-y1l§;
         var context:Context3D = Starling.context;
         var support:Object = target.§_-g28§["RenderTexture.supportsNonPotDimensions"];
         if(support == null)
         {
            if(target.profile != "baselineConstrained" && "createRectangleTexture" in context)
            {
               try
               {
                  texture = context["createRectangleTexture"](2,3,"bgra",true);
                  context.setRenderToTexture(texture);
                  context.clear();
                  context.setRenderToBackBuffer();
                  context.createVertexBuffer(1,1);
                  support = true;
               }
               catch(e:Error)
               {
                  support = false;
               }
               finally
               {
                  if(texture)
                  {
                     texture.dispose();
                  }
                  if(buffer)
                  {
                     buffer.dispose();
                  }
               }
            }
            else
            {
               support = false;
            }
            target.§_-g28§["RenderTexture.supportsNonPotDimensions"] = support;
         }
         return support;
      }
      
      private function get §_-51y§() : Boolean
      {
         return this.§_-623§ != null;
      }
      
      public function get §_-Km§() : Boolean
      {
         return this.§_-d1W§;
      }
      
      override public function get base() : TextureBase
      {
         return this.§_-G2S§.base;
      }
      
      override public function get root() : §_-n2K§
      {
         return this.§_-G2S§.root;
      }
   }
}

